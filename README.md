# Meteorite
### Summary of Dataset
meteorite <- read.csv(file = 'meteorite-landings.csv')  
str(meteorite)
>$ name       : Factor w/ 45716 levels "Aachen","Aarhus",..: 1 2 6 10 406 417 429 430 435 454 ...  
 $ id         : int  1 2 6 10 370 379 390 392 398 417 ...  
 $ nametype   : Factor w/ 2 levels "Relict","Valid": 2 2 2 2 2 2 2 2 2 2 ...  
 $ recclass   : Factor w/ 466 levels "Acapulcoite",..: 333 197 85 1 339 85 360 190 339 242 ...  
 $ mass       : num  21 720 107000 1914 780 ...  
 $ fall       : Factor w/ 2 levels "Fell","Found": 1 1 1 1 1 1 1 1 1 1 ...  
 $ year       : int  1880 1951 1952 1976 1902 1919 1949 1814 1930 1920 ...  
 $ reclat     : num  50.8 56.2 54.2 16.9 -33.2 ...  
 $ reclong    : num  6.08 10.23 -113 -99.9 -64.95 ...  
 $ GeoLocation: Factor w/ 17101 levels "","(-1.002780, 37.150280)",..: 16779 16983 16923 9106 844 14808 16496 16453 784 721 ...  

#### Amount of two types of Meteorit
* _valid_: a typical meteorite
* _relict_: a meteorite that has been highly degraded by weather on Earth  

table(meteorite$nametype)   

Relict | Valid 
--- | --- 
75 | 45641 

#### Amount of two types of Observation  
* _Fell_: the meteorite's fall was observed
* _Found_: the meteorite's fall was not observed

table(meteorite$fall)

Fell | Found
--- | --- 
1107 | 44609

#### Weighth of Meteorite
