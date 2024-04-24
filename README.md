# DE1-projekt
- Vendula Šmídová, Marek Šulc - vytváření a implementace časovací části, video, top level

- Vojtěch Šolc, Ondřej Slonek - vytváření a sestavení nových využitých prvků, read me file, top level

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

<img src="https://github.com/mara03s/DE1-projekt/assets/164920387/7ff6ad99-1e27-43ea-85eb-47c6f1b0045e" width="70%">

Komponenty desky Nexys A7-50T

![senzor](https://github.com/mara03s/DE1-projekt/assets/164920387/be1a75f3-255d-4c5a-aa9f-889d8850ef73)
<img src="https://github.com/mara03s/DE1-projekt/assets/164920387/0ccdab1f-673f-4b67-93d8-b6816c0eb4a3" width="50%">

Senzor HC-SR04 a naznačení jeho funkce

## Popis a simulace komponent
![top level](https://github.com/mara03s/DE1-projekt/assets/164920387/5ed7055a-711a-4d0e-8269-ecf54b5e931d)

Zapojení top_level

- [Registr](./sim/tb_registr.vhd) - pole d-latchů, jeho primární funkcí je pustit výstup až po dokončení počítání délky pulsu
![registr](https://github.com/mara03s/DE1-projekt/assets/164920387/30bf3e46-36f9-4578-8a19-8fffee55fce3)

- [MUX_display](./sim/tb_MUX_display.vhd) - tříbitový MUX pro osmibitové sběrnice
![mux_display](https://github.com/mara03s/DE1-projekt/assets/164920387/e597b730-3e32-4a25-ae78-f3e41ddf67ec)

- [top_clock](./sim/tb_top_clock.vhd) - sdílená část programu zajišťující jeho časování
![clk_en](https://github.com/mara03s/DE1-projekt/assets/164920387/fa4d7d30-fc3c-418d-8bc4-a36ff71317ce)

- [multiplex_dec](./sim/tb_multiplex_dec.vhd) - MUX se vstupem jednoho bitu pro čtyřbitové sběrnice který určuje jestli pokračují dál bity jednotek nebo desítek
![multiplex_dec](https://github.com/mara03s/DE1-projekt/assets/164920387/8471a6b1-f3ba-4f65-b534-56aa881ef9d4)

## Instrukce

U naší implementace využíváme prvních 8 switchů pro dimenzaci rozsahu přičemž první čtveřici využíváme pro nastavení jednotek, a druhou čtveřici využíváme pro nastavení desítek centimetrů pro rozsvícení diody pomocí dekadické abecedy(dioda se rozsvěcí pokud se dostaneme pod požadovanou nastavenou úroveň), a další tři switche využíváme pro výběr senzoru. 

<img src="https://github.com/mara03s/DE1-projekt/assets/164920387/42f4d87d-50ef-44af-a00d-6370fc46d6d3" width="30%">

<img src="https://github.com/mara03s/DE1-projekt/assets/164920387/784130b5-79d3-4c7f-9d3c-17ebe49b70ee" width="30%">


Sestavení našeho praktického zapojení


## Video
[![YouTube Video](https://img.youtube.com/vi/8es4DcSuvOQ/0.jpg)](https://www.youtube.com/watch?v=8es4DcSuvOQ&ab_channel=WendySchmidt)



## Zdroje
https://digilent.com/reference/programmable-logic/nexys-a7/start
