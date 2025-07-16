# vivado-am2940-dma-generator
Verilog implementation of the Am2940 DMA Address Generator for a Xilinx FPGA as a university project during summer practice at AMD.

# Modul 0 - transfer de date  
**Adresă Start: 5**  
**Număr de Cuvinte: 3**

## Descriere  
Acest scenariu testează funcționalitatea Modulului 0 (WRCR) într-un sistem controlat prin comutatoare (SW), butoane (BTN) și LED-uri (LD). Se verifică inițializarea, setarea adresei de start, numărul de cuvinte și rularea transferului, cu confirmări vizuale prin LED-uri.

## Etape de Testare

### Pasul 0: pregătirea și resetarea

1. setează controalele globale:
   - `SW9 (nOEA)` = OFF (0) - Activează LED-urile de adresă.
   - `SW7 (ACI)` = ON (1)
   - `SW8 (WCI)` = ON (1)

2. execută Reset:
   - `SW11 (res)` = ON (1)
   - Apasă și eliberează `BTN0 (clk)` o dată.
   - `SW11 (res)` = OFF (0)

**Rezultat așteptat**: LED-urile de adresă (`LD0`–`LD3`) sunt stinse (`0000`).

### Pasul 1: setare Modul 0 (WRCR)

- Instrucțiune (I=000):
  - `SW2` = OFF, `SW1` = OFF, `SW0` = OFF
- Date (D_IN=0000):
  - `SW6`–`SW3` toate pe OFF

Execută: apasă și eliberează `BTN0`.

### Pasul 2: încarcă adresa de start = 5 (LDAD)

- Instrucțiune (I=101):
  - `SW2` = ON, `SW1` = OFF, `SW0` = ON
- Date (D_IN=0101):
  - `SW6` = OFF, `SW5` = ON, `SW4` = OFF, `SW3` = ON

Execută: apasă și eliberează `BTN0`.

**Verificare**: LED-urile de adresă (`LD3`–`LD0`) afișează `0101` (Adresa 5).

### Pasul 3: încarcă nr. cuvinte = 3 (LDWC)

- Instrucțiune (I=110):
  - `SW2` = ON, `SW1` = ON, `SW0` = OFF
- Date (D_IN=0011):
  - `SW6` = OFF, `SW5` = OFF, `SW4` = ON, `SW3` = ON

Execută: apasă și eliberează `BTN0`.

**Verificare**: LED-urile de adresă rămân la `0101`.

### Pasul 4: pornește transferul (ENCT)

- Instrucțiune (I=111):
  - `SW2` = ON, `SW1` = ON, `SW0` = ON

Execuție prin apăsări succesive pe `BTN0`:

| Apăsare | Adresă (`LD3-LD0`) | LED-uri de Stare                          |
|---------|--------------------|-------------------------------------------|
| 1       | `0110` (6)         | -                                         |
| 2       | `0111` (7)         | `LD11 (DONE - albastru)` se aprinde        |
| 3       | `1000` (8)         | `LD11` se stinge, `LD9 (WCO)` se aprinde   |

## Rezultate așteptate

- incrementarea adresei la fiecare clic pe `BTN0`.
- semnalizarea corectă prin LED-ul `DONE` după a doua apăsare.
- activarea LED-ului `WCO` la finalul transferului (a treia apăsare).



