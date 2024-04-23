# DE1-projekt
- Vendula Šmídová, Marek Šulc - vytváření a implementace časovací části, video 

- Vojtěch Šolc, Ondřej Slonek - vytváření a sestavení majority využitých prvků, read me file

## Teoretický popis problému

Jako zadání naší práce jsme si vybrali návrh systému pro parkovací systém za pomoci využití ultrasonických senzorů. Po společné konzultaci jsme k návrhu přistoupili tak, že pošleme aktivační puls, na ten odpovídá senzor signálem úměrný vzdálenosti. 

## Hardware popis

U této práce máme k dispozici desku Nexys A7-50T která je velmi kvalitní komponentou která má velmi širokou škálu využití díky své vysoké kapacitě pamětí a vysokému počtu a možností konektorů. 
Dále v naší implementaci využíváme ultrasonických senzorů (HC-SR04) pomocí kterých budeme detekovat hodnoty vzdálenosti, tento senzor nejlépe pracuje v hodnotách do 1 metru, tudíž náš senzor má horní hranici snímání přibližně 90 cm. 
Také využíváme desky arduino, která zde však ovšem plní pouze napájecí činnost pro senzor. 

![nexys schematic](https://github.com/mara03s/DE1-projekt/assets/164920387/6ee4a2be-85da-4d50-bc24-f7f8fd9d267a)

Schématické zapojení pro desku Nexys A7-50T

![nexys deska](https://github.com/mara03s/DE1-projekt/assets/164920387/4b354c95-2848-4545-ac41-fb4b50a6963e)

Deska Nexys A7-50T

![nexys componenty](https://github.com/mara03s/DE1-projekt/assets/164920387/7ff6ad99-1e27-43ea-85eb-47c6f1b0045e)

Komponenty desky Nexys A7-50T

![senzor](https://github.com/mara03s/DE1-projekt/assets/164920387/be1a75f3-255d-4c5a-aa9f-889d8850ef73)
![senzor funkce](https://github.com/mara03s/DE1-projekt/assets/164920387/0ccdab1f-673f-4b67-93d8-b6816c0eb4a3)

Senzor HC-SR04 a naznačení jeho funkce

## Software popis


## Simulace komponent

##Instrukce 
U naší implementace využíváme prvních 8 switchů pro dimenzaci rozsahu přičemž první čtveřici využíváme pro nastavení jednotek, a druhou čtveřici využíváme pro nastavení desítek centimetrů pro rozsvícení diody pomocí dekadické abecedy(dioda se rozsvěcí pokud se dostaneme pod požadovanou nastavenou úroveň), a další tři switche využíváme pro výběr senzoru. 

<img src="https://github.com/mara03s/DE1-projekt/assets/164920387/42f4d87d-50ef-44af-a00d-6370fc46d6d3" width="30%">

<img src="https://github.com/mara03s/DE1-projekt/assets/164920387/784130b5-79d3-4c7f-9d3c-17ebe49b70ee" width="30%">


Sestavení našeho praktického zapojení


## Video



## Zdroje
https://digilent.com/reference/programmable-logic/nexys-a7/start
