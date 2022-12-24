### ECHIPA 7 - Proiect 10

Fie urmatoarea problema de clasificare nesupervizata: [Music Origin](https://www.kaggle.com/datasets/yadhua/geographical-origin-of-music?select=Music_origin_chromatic.csv)  
Exemplificati proiectarea si construirea unui model cu k-means considerand pasii urmatori: 
- Incarcati setul de date si separati doua array-uri X si Y pentru intrari si pentru tinte (fiecare esantion pe un rand); 
- Analizati setul de date, verificati daca contine valori lipsa sau nedefinite, eliminati sau corectati datele respective cu isnan; 
- Calculati media, dispersia, valorile minime si maxime pentru variabilele de intrare pentru a vedea daca exista discrepante majore sau daca aveti esantioane izolate; 
- Construiti setul de date de antrenare testare  prin partitionare aleatoare 80%-20%, 70%-30%, 60%-40% si 50%-50%. Verificati distributia din seturile de date. 
- Proiectati modelele cu fitctree folosind seturile de antrenare; 

Calculati performanta fiecarui model pe setul de antrenare si testare in termeni de acuratete, sensibilitate, precizie, scor F1;
