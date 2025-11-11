
(Slide 1)

Bonjour à tous, merci d’être venus aujourd’hui.
Dans cette session on va parler d’un sujet un peu particulier : Quand on construit une plateforme développeur, on pense disponibilité, scalabilité, UX… mais rarement testabilité.
Aunourd'hui nous allons donc parler de platforme bien sur, mais surtout voir comment appliquer le Test-Driven Development au Platform Engineering.

Voici ce qui nous attend pendant cette session :

(Slide 2)

Premièrement, nous allons construire une plateforme sans aucun test. On va la faire tourner, et — sans surprise — quelque chose va mal se passer.

Deuxièmement, nous introduirons le Test-Driven Development. On repartira de zéro pour reconstruire la même plateforme, cette fois en écrivant les tests avant le code, afin de garantir que les contrats de la plateforme restent valides à chaque changement.

Et troisièmement, nous verrons comment ces tests peuvent être exécutés automatiquement — à la fois localement, par un platform engineer pendant le développement, et par les équipes consommatrices de la plateforme, pour valider leurs intégrations.

(Slide 3)

Et avant de rentrer dans le vif du sujet, on va commencer par les présentations.

Je donne d’abord la parole à Sara, qui va se présenter.

(Sara se présente)
(Je me présente a mon tour)

Voilà, maintenant que les présentations sont faites…

Sara, notre platform engineer préférée, est-ce que tu peux nous présenter le besoin et la plateforme qu’on va construire aujourd’hui ?

(Slide 4)

(Slide 5)

Merci !

Alors, pour cette session, on va partir d’un besoin simple — mais tout à fait réaliste :

👉 Notre objectif : faire tourner une application Drupal.

Pour ça, on a deux équipes :

Une équipe Platform, qui gère tout ce qui est bases de données, CI/CD, infrastructure, services partagés…

Et une équipe Dev, qui s’occupe du Drupal en lui-même et consomme les services fournis par l’équipe plateforme.

En apparence, tout est clair, chacun son rôle…

What could possibly go wrong, right? 😄

(Slide 6)

Pour construire notre plateforme, on va s’appuyer sur une stack technique moderne, mais assez représentative de ce qu’on trouve dans beaucoup d’équipes aujourd’hui :

Kubernetes, pour orchestrer nos workloads.

ArgoCD, pour le déploiement GitOps et la synchronisation de nos environnements.

Et Crossplane, pour le provisioning d’infrastructure à la demande, directement depuis Kubernetes.

Rien d’exotique — juste les outils qu’on aime tous… et qui peuvent quand même nous surprendre quand on n’a pas de tests. 😅

(Slide 7)

Très bien, maintenant que le besoin est posé et que la stack est claire, il est temps de passer à l’action.

Pour bien comprendre l’importance du Test-Driven Development, on va commencer par construire notre plateforme… sans aucun test.

Oui, vous avez bien entendu : on va déployer et utiliser la plateforme telle quelle, pour voir ce qui se passe quand rien n’est vérifié automatiquement.

Et comme vous pouvez l’imaginer… l’inévitable va se produire. 😅

Alors, asseyez-vous confortablement, et voyons ensemble ce qui peut mal tourner quand on ignore la testabilité dès le départ.

(Slide 8)

Le schéma du design.

(Slide 9)

Démo time.

(Slide 10)

Eh bien… voilà exactement le genre de situation que nous voulions vous montrer. 😅

Quand on construit une plateforme sans tests, les erreurs finissent par arriver — et elles peuvent avoir des conséquences inattendues.

Mais il existe un moyen de réduire ce stress et de garder confiance dans nos changements : le Test-Driven Development.

Dans la suite de cette session, nous allons voir comment reconstruire cette même plateforme en utilisant le TDD dès le départ, pour que les contrats entre l’équipe platform et les équipes développeurs restent valides, et que ce genre d’incident soit beaucoup moins probable.

(Slide 11)

Très bien, maintenant qu’on a vu ce qui peut mal tourner quand on ne teste rien, reprenons depuis zéro.

Cette fois, nous allons adopter une approche Test-Driven :

Nous allons commencer par écrire les tests avant le code.

Ensuite, nous allons construire les services de la plateforme en nous assurant que chaque fonctionnalité passe les tests.

Nous ferons des changements et évolutions au fur et à mesure, avec la certitude que nos tests garantissent le fonctionnement correct de la plateforme.

Et surtout, nous ne déployons que lorsque tous les tests passent.

L’objectif est simple : montrer comment le TDD peut nous donner confiance dans nos changements et réduire drastiquement les incidents dans une vraie plateforme.

(Slide 12)

Très bien, passons maintenant en mode démo.

Nous allons reconstruire notre plateforme depuis zéro, mais cette fois-ci en suivant strictement le Test-Driven Development.