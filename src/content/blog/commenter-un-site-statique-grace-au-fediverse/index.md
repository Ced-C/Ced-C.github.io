+++
title = "Commenter un site Statique (Zola) grâce au Fédiverse"
date = 2026-02-14
draft = false
[taxonomies]
tags = ["FOSS", "zola", "tuto", "documentation"]
[extra]
toc = false
display_published = true 
author = "Cætera"
comment_id = "116097404321113580"
+++

Un blog sert à publier, mais aussi à échanger.
J’utilise un site statique pour sa simplicité et sa robustesse, hébergé sur GitHub Pages. Cela fonctionne très bien, mais il n’y a pas de système de commentaires intégré.

Par défaut, je propose de me contacter via le Fédiverse, par exemple sur Mastodon. Je republiais parfois mes billets sur mon compte, et le fil de discussion servait alors de section de commentaires.
Je me suis demandé s’il était possible d’afficher directement ces discussions sous mes articles, sans transformer mon site en application dynamique.

En parcourant le blog de [Hyde](https://lazybea.rs/), notamment via sa série Under/Over et l’intervention de [Ploum](https://mamot.fr/@ploum), j’ai vu son intégration inspirée d’[un article de Carl Schwan][cs], j’y ai trouvé une solution simple : charger les commentaires depuis l’API Mastodon côté client. J’ai adapté cette approche à [zola].


Le principe
-----------
Mastodon expose une API permettant de récupérer le contexte d’un message :
```sh
https://${ host }/api/v1/statuses/${ comment_id }/context
```
Cette API renvoie les messages précédents (_ancestors_) et les réponses (_descendants_).
Dans notre cas, seuls les descendants nous intéressent : ce sont les commentaires.

Un script JavaScript se charge de :
- récupérer ces données ;
- générer le HTML correspondant ;
- insérer les commentaires dans la page.

### Limites
Cette approche a quelques limites à garder en tête, de la moins pénible à la plus contraignante :
1. Il faut avoir JavaScript d’activé, c’est une majorité de personnes, mais pas tout le monde. On peut envoyer vers le fil mastodon pour ceux qui ne l’on pas d’activé. 
2. Le _workflow_ est manuel et un poil pénible, il faut :
   1. Publier le billet ;
   2. publier le lien sur le Fédiverse ;
   3. récupérer l’identifiant du post ;
   4. ajouter cet indentifiant dans les métadonnées du billet ;
   5. republier le site.
3. les foncitonnalités de mastodon ne sont pas toutes gérées : pas de CW, de pièces jointes.
4. La modération est déléguée à Mastodon, on a moins de contrôle sur ce qui se fait. Si on est admin de son instance c’est pas trop gênant, mais ce n’est pas mon cas. 
5. Le billet dépend de l’instance : si le post disparaît, les commentaires aussi. Une solution serait d’archiver régulièrement les réponses côté serveur, ce que je n’ai pas encore mis en place.

Tout ça me semble globalement acceptable, on va donc passer à la suite : l’implémentation. 

Intégration à Zola
------------------

### Variables d’environnement 
Dans le fichier `config.toml`, j’ajoute l’adresse de l’instance cible et le nom de l’utilisateur qui postera les billets.
```toml
[extra.mastodon]
host = "diaspodon.fr"
username = "CedC"
```
Chaque billet peut ensuite définir l’identifiant du post mastodon dans ses métadonnées (_frontmatter_).
```toml
[extra]
comment_id = "1234567890"
```
> **Note :**
> J’ai choisi de mettre l’adresse de l’instance dans la configuration globale du site pour éviter d’avoir à le taper pour chaque billet, mais cela sous-entend qu’on ne changera pas d’instance en cours de route. Il serait sûrement plus sûr de mettre le tout dans les métadonnées pour plus de flexibilité.

### Template HTML
Dans `page.html`, le squelette des pages de mon blog dans zola, j’ajoute une section commentaires peuplée si `comment_id` est défini.
```html
<comments id="comments">
    {% if page.extra.comment_id %}
      {% set comment_id = page.extra.comment_id %}
      {% include "shortcodes/comments.html" %}
    {% endif %}
</comments>
```
Le fichier `shortcodes/comments.html` contient le bouton de chargement et les variables nécessaires au script JavaScript. Le fait de le séparer ainsi plutôt que d’intégrer le tout directement dans la page permet d’appeler le shortcode `comments(comment_id=foo)` à l’intérieur d’un fichier markdown si besoin. Ça permet en outre de garder une structure claire pour notre blog.

### JavaScript
Tous les scripts sont dans le dossier `static/js/comments`
J’ai retouché à la marge le script de Scott, simplement pour modifier l’HTML généré, le simplifier un peu et l’adapté pour mon blog. 
Tout le reste est intact. C’est plutôt bien fait, il y a même un appel à `DOMPurify` pour éviter les attaques par _crosscritpting_. J’ai préféré rapatrier en local le fichier plutôt que de faire appel à un CDN. 

### Style
Le ficher `static/css/comments.css` gère le style des commentaires de façon minimale.
Le style est volontairement simple : avatar à gauche, contenu à droite, métadonnées en haut et actions en bas. Pas de couleur pour s’adapter le plus facilement possible aux différents thèmes.

### Vue globale des modifications
On a modifié beaucoup de fichiers, voici un récapitulatif des fichiers touchés :
```sh
.
├── config.toml
├── content/blog/*.md          # comment_id dans le frontmatter
├── static
│   ├── css/comments.css
│   └── js/comments/
│       ├── comments.js
│       ├── purify.min.js
│       └── purify.min.js.map
└── templates
    ├── page.html
    └── shortcodes/comments.html
```

Conclusion
----------
C’est ainsi que j’ai récupéré un système de commentaires pour mon site statique.
L’intégration reste simple, facultative et minimaliste, avec un code que je peux comprendre et maintenir.

Je délègue au Fédiverse la gestion et l’archivage des commentaires. Ce n’est pas un contrôle total, mais c’est un compromis que j’accepte volontiers : pas de base de données, pas de backend, et des échanges décentralisés.

Ce projet n’aurait pas été possible sans le travail et les partages d’autres personnes. Je publie donc cette adaptation à mon tour, pour contribuer à cette chaîne.

Si vous utilisez Zola (ou un autre générateur statique), cette approche devrait s’adapter sans trop de difficultés.


[cs]: https://carlschwan.eu/2020/12/29/adding-comments-to-your-static-blog-with-mastodon/
[zola]: https://www.getzola.org/
