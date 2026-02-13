+++
title = "GrapheneOS : la pénultième étape de ma déGAFAMisation"
date = 2026-02-04
draft = false
[taxonomies]
tags = ["FOSS", "mobile", "GAFAM"]
[extra]
toc = false
display_published = true 
author = "Cætera"
comment_id = "116011135470347757"
+++

Je ne pensais pas réinstaller une ROM sur un téléphone un jour.

J'avais essayé CyanogenMod il y a longtemps, plus de 10 ans, au début des smartphones. Si ça fonctionnait assez bien, je n'y avais pas vu de véritable bénéfice à l'époque. C'était censé être plus léger, mais c'était quand même poussif avec mon téléphone d'alors, un LG Optimus L7 de mémoire.

J'ai donc arrêté de regarder.

J'avais entendu parler de [GrapheneOS][grapheneOS], mais pas au point de vouloir essayer. Après tout, mon téléphone est mon outil de travail, j'ai besoin que ça fonctionne. Mais Android (comme iOS) n'est pas parfait. Pire, il y a des défauts qui me dérangent vraiment :

- Il n'est pas possible de supprimer certaines applications comme YouTube par défaut. Et c'est parfois tentant de regarder une vidéo au moindre temps mort (_cf._ mon [article sur l'attention][article-tdah]) ;
- Servir ses données sur un plateau d’argent à une entreprise qui s’en servira probablement pour entraîner des IA qui ne correspondent pas au modèle que je défends ;
- Le fait de ne pas pouvoir contrôler son téléphone complètement et de se voir des fonctionnalités refusées sans Android/iOS. Pas de paiement sans contact possible avec des systèmes alternatifs comme [Ubuntu Touch][ubtouch] ou [Plasma Mobile][kdemobile] ; pire, l’État pousse de plus en plus pour avoir des applications « sécurisées » pour accéder à ses services numériques, comme [FranceConnect+][frconnect], qui demande d’avoir un téléphone dépendant des États-Unis.

Donc quand mon téléphone —le premier téléphone Google que j'achète— tombe en rade après moins de deux ans, je me dis que je ne veux plus donner de l’argent à Google et me demande quelles sont les alternatives.

En cherchant les alternatives possibles, je ne trouve pas grand-chose de très enthousiasmant. Je retombe par contre sur GrapheneOS, et c'est là que je me dis qu'il est peut-être temps de dire au revoir à l'un des derniers services des GAFAM que j'utilise : Android.


Installation
---
J'achète un téléphone Google d'occasion, en m'assurant que le problème connu que j'ai eu sur celui qui a rendu l'âme (chargement d'électricité statique) est résolu. Je prends un modèle reconditionné, pas cher.

Ça fera le taf.

J'ai un plan pour me passer complètement de téléphone à l'avenir, mais il faut encore que j'essaie « pour de vrai ». Je me dis que, sur le papier, GrapheneOS répond à beaucoup de problèmes que j'ai soulevés avec Android :

1. Il est compatible avec toutes les applications, ou presque  
2. Il permet d'avoir les services Google dans un environnement cloisonné pour les applications qui s'appuient dessus (plus qu'on ne le pense). Il permet en outre de choisir les accès qu'on donne à Google, qui est traité comme n'importe quelle autre application  
3. Il ne transmet pas de données personnelles par défaut  
4. Il se veut plus sécurisé, même si je n'ai pas les compétences pour le vérifier  

C'est pas mal, donc. Suffisamment prometteur pour se donner la peine de l'installer. J'ai le souvenir de procédures compliquées pour les ROMs de l'époque ; est-ce toujours le cas ?

Étrangement, non ! C'est beaucoup plus simple. Mais pas accessible à tout le monde pour autant.

Sous Linux, il y a deux façons d'installer :
1. Une interface web qu'ils proposent  
2. La ligne de commande  

Je tente l'option de la simplicité, ça ne fonctionne pas. Le retour n'est pas très loquace sur les raisons pour lesquelles l'étape échoue. Je le comprendrai plus tard.

Je me retranche sur la ligne de commande et je comprends qu'une bibliothèque est obsolète et que je dois installer la dernière version à la main pour pouvoir avancer. J'aurais peut-être pu retourner sur l'interface web pour la suite, mais maintenant que je suis devant un terminal, je continue. Au moins, les erreurs donnent des pistes sur le _pourquoi_ une étape échoue.

Pour peu qu'on sache lire une documentation, interpréter les retours de la ligne de commande et qu'on ait quelques notions d'informatique, l'installation n'est pas trop compliquée.

J'aurais peut-être eu la naïveté de le recommander à n'importe qui avant, mais force est de constater que ce n'est pas le cas. Ma compagne n'aurait pas réussi. Il faut quand même comprendre ce qu'on fait, savoir mettre à jour des dépendances à la main, même sous Ubuntu 25.10, qui se veut pourtant récent.

Une fois installé, on a un petit message à chaque redémarrage indiquant qu'un autre OS qu'Android est installé. Je ne sais pas si c'est censé faire peur, mais moi, ça me rassure. Ça veut dire que Google ne sait pas ce que je fais, et que ça l'embête.


## Utilisation
À l’utilisation, ce n’est pas très différent d’Android. C’est même pratiquement la même chose, à ceci près que l’on dispose d’un peu plus de contrôle sur les autorisations accordées aux applications. Toutes les applications. Même celles de Google, que j’évite.

L’environnement cloisonné dans lequel on peut installer les services Google est très simple d’accès, et des réglages permettent de définir des règles afin de le désactiver automatiquement. Je m’en sers peu, mais l’expérience est très fluide, bravo pour cette approche.

### Applications utilisées

J'installe les applications de préférence via [F-Droid][fdroid] quand je trouve mon bonheur (souvent), sinon je passe par Aurora, qui permet d'accéder aux applications présentes sur le Play Store.

**Via F-Droid :**
- Fossify Calendar – très bon calendrier  
- Aves Libre – galerie  
- CoMaps – GPS hors ligne avec circuits de randonnée très précis. C’est un peu long à se géolocaliser, mais ça fonctionne globalement bien  
- Nextcloud – sauvegarde de photos sur le cloud et accès à mes fichiers personnels  
- DAVx⁵ – synchronisation du calendrier et des contacts  
- Forkgram – client Telegram que j’utilise encore avec ma famille. Au moins, ce n’est pas un GAFAM  
- ProtonVPN, Proton Authenticator – j’utilise beaucoup l’écosystème [Proton][proton]. Ce sont les seules applications que j’utilise qui sont sur F-Droid  
- Tusky – client Mastodon  
- PipePipe – accès minimaliste à YouTube, avec lecture en arrière-plan  
- Breezy Weather – météo  

**Via Aurora :**
- [Obsidian][obsidian]  
- Application bancaire  
- LinkedIn — malheureusement nécessaire pour mon métier  
- Proton Mail – parce qu'il n'est pas sur F-Droid  
- Firefox Focus – j'aime bien l'expérience minimaliste qu'il propose comme navigateur par défaut. Firefox ensuite pour la synchronisation avec [Zen Browser][zenbrowser] sur desktop  
- Radio France – je vous avais dit que France Culture, c'est pas trop mal ?  
- SimpleLogin – masquer ses adresses mail est devenu nécessaire  
- WhatsApp – je ne m'en sers quasiment plus, mais ça fonctionne  

**Via Google Play (dans l'environnement confiné) :**
- Maps, que j'utilise parfois pour les informations sur le trafic routier  
- Wallet, pour l’accès aux cartes de fidélité ; le paiement, lui, ne fonctionne pas, Google ne pouvant pas « certifier » l’appareil  

Voilà. C'est assez sommaire, mais c'est ce que j'utilise depuis un mois. C'est donc assez représentatif de mon usage du téléphone.


## Déceptions

Je m’y attendais, mais forcément, il y a des concessions à faire.

L’application caméra et sa gestion native des QR codes ne sont pas folichonnes : on ne peut pas scanner un contact et l’ajouter, ni se connecter directement à un réseau Wi-Fi. Il faudrait que je trouve une meilleure application, mais c’est pénible de ne pas avoir cela intégré par défaut. Un petit bémol, mais rien de grave.

Pour être honnête, je m'attendais à ce que _plus_ de choses ne fonctionnent pas. Globalement, je suis donc plutôt agréablement surpris. La grande majorité des applications fonctionnent bien. Les paiements, non. C’était prévu, mais j’ai maintenant la confirmation.

Il semblerait qu’une solution comme [Curve][curve] fonctionne sous GrapheneOS, mais je n’ai pas essayé. De ce que j’ai compris, contrairement à Google Pay ou Samsung Pay, l’application a besoin d’accéder à Internet pour fonctionner, ce qui la rend en principe moins fiable.

Tant pis, j’utiliserai ma montre connectée pour payer… sauf que.

### Watch

La connexion à une montre Google ne fonctionne pas. Or, il est obligatoire d'appairer la montre avec un téléphone pour s'en servir. C'est frustrant, et ça rend mon nouvel achat inutilisable tel quel.

Il semblerait que certains aient réussi à appairer les deux, mais je ne sais pas si je suis passé à côté de quelque chose ou si les règles ont évolué. En tout cas, je n’ai pas réussi.

Comme solution temporaire, j'ai utilisé le téléphone de mon âme sœur, mais cela me donne accès à ses notifications, ce qui n'est pas idéal. Il faudrait que j'essaie avec une tablette Android quand je remettrai la main sur celle qui dort au fond d’un placard depuis des lustres.

### Android Auto

Là, c’est plus pénible et ça joue sur la sécurité. J'ai l'impression qu'il est possible de le faire fonctionner — en tout cas, on trouve sur le web des gens qui y arrivent — mais chez moi, ça ne fonctionne pas. Peu importe les permissions accordées à Google, même en étant _open bar_, rien à faire.

Je vais bientôt retrouver ma vieille voiture, qui n'est pas compatible, donc ce n'est pas trop gênant. Mais c'est quand même un confort énorme de pouvoir afficher le GPS de son choix sur l'écran central de la voiture. Il est à la bonne hauteur, on dirait presque que c'est fait pour. Pouvoir contrôler la musique ou la radio depuis cet écran est aussi extrêmement pratique.

Je prenais ça pour acquis. Il semblerait que ce soit un luxe dont le prix à payer est _toute_ ma vie privée. C’est trop cher. Je ne payerai pas.

---

Ce sont les deux ou trois concessions à faire pour avoir un système plus libre. Pour moi, ça vaut le coup. Mais chacun voit midi à sa porte. Je continuerai d’acheter des téléphones Google reconditionnés et d’y installer GrapheneOS à chaque fois que j’en aurai besoin. Pas trop souvent, j’espère : je trouve les Pixels plutôt fragiles.

Il faudrait aussi que je teste plus sérieusement les applications bancaires en France. Consulter ses comptes fonctionne, mais qu’en est-il des virements, de l’activation de services comme Wero, etc. ? À tester.


## Conclusion

Après près de deux mois d’utilisation, je suis encore dans la période de lune de miel, certes. Tout n’est pas parfait, et certaines concessions sont réelles. Le paiement sans contact, Android Auto, les montres connectées : autant de rappels que l’écosystème Google est conçu pour enfermer, pas pour être quitté.

Mais une chose est sûre : je n’ai pas envie de revenir en arrière. GrapheneOS m’a rappelé quelque chose d’essentiel : les frustrations que l’on ressent avec Android ou iOS ne sont pas des bugs, ce sont des choix. Le manque de contrôle, la dépendance aux services centralisés, l’impossibilité de dire non sans perdre des fonctionnalités —tout cela fait partie du modèle.

Accepter de perdre un peu de confort pour reprendre la main sur un outil aussi central que le téléphone me semble aujourd’hui être un compromis sain. Android était l’un des derniers produits des GAFAM que j’utilisais de façon intensive. GrapheneOS me permet, pour l’instant, de m’en passer sans me couper du monde.

Reste un paradoxe difficile à avaler : en 2025, les seuls téléphones réellement compatibles sont ceux de Google. Pire, l’installation n’est pas simple. Tant que cela n’évoluera pas, GrapheneOS restera une alternative de niche, réservée aux utilisateurs motivés et aux dealers. J’espère qu’un constructeur proposera un jour des modèles avec l’OS préinstallé, mais cela semble mal engagé pour [Fairphone][fairphone] en tout cas : les développeurs de GrapheneOS se sont prononcés contre.

GrapheneOS est aujourd’hui aux téléphones ce que Linux était aux ordinateurs au début des années 2000. Si je suis content de m’en servir et que je ne compte pas revenir en arrière, je ne suis pas aussi enthousiaste que je l’ai été avec Linux ou Firefox OS par le passé. ~~Étant un projet États-Unien, difficile de savoir comment l’OS évoluera à l’avenir et à quelles lois ses développeurs seront confrontés.~~

**Edit 2025-02-05** : Suite aux retours de GrapheneOS et de quelques autres personnes sur Mastodon, je souhaite corriger une erreur de taille : GrapheneOS n’est pas états-unien. Le fondateur et développeur principal initial de GrapheneOS est canadien. Il est l’un des trois directeurs de l’organisation à but non lucratif. Le développeur principal actuel est ukrainien et fait également partie des directeurs. Le dernier directeur est kazakh. Suite à une augmentation de leur trésorerie, ils ont commencé à embaucher (en télétravail) un développeur basé aux États-Unis ; d’autres embauches similaires sont prévues.

Des utilisateurs ont confimés avoir Android Auto de fonctionnel, et la pixel watch devrait l’être également. 

[grapheneOS]: https://grapheneos.org/
[fdroid]: https://f-droid.org/
[article-tdah]: @/blog/pourquoi-se-concentrer-est-devenu-un-acte-militant/index.md
[ubuntu]: https://ubuntu.com/
[fairphone]: https://www.fairphone.com/
[curve]: https://www.curve.com/
[obsidian]: @/blog/organiser-sa-vie-avec-md/index.md
[zenbrowser]: @/blog/zen-browser/index.md
[proton]: https://proton.me/
[ubtouch]: https://www.ubuntu-touch.io/
[kdemobile]: https://plasma-mobile.org/ 
[frconnect]: https://www.franceconnect.gouv.fr/franceconnect-plus
