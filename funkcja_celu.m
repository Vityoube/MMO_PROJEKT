[num,txt,baza]=xlsread('/home/vkalashnykov/WEEiA_PROJEKTY/Semestr2_2stopien/MMO/projekt/MMO.xlsx');
dane = baza(2:end,2:13);
naglowki = baza(1:1,1:13);
oznaczenia=baza(1:13,15:27);
[kol,rzad] = size(dane);


konw=cellfun(@double,dane,'UniformOutput',false);
macierz = cell2mat(konw);


segment = macierz(:,1)
naped = macierz(:,2)
paliwo = macierz(:,3)
nadwozie = macierz(:,4)
moc = macierz(:,5)
miejsca = macierz(:,6)
poj = macierz(:,7)
pre = macierz(:,8)
bieg = macierz(:,9)
poch = macierz(:,10)
rok = macierz(:,11)
bag = macierz(:,12)

A=zeros(kol,1);
B=zeros(kol,1);
C = zeros(kol,1);
for j = 1:1:50
    if j~=6
    if((moc(j)<600)&&(moc(j)>400))
        if((bag(j)<700)&&(bag(j)>500))
            if((pre(j)<400)&&(pre(j)>200))
    A(j,1)= 1*(segment(j))+0*(naped(j))+0.9*(paliwo(j))+0.8*(nadwozie(j))+0.6*(moc(j))+0.3*(miejsca(j))+0.5*(poj(j))+0.7*(pre(j))+0*(bieg(j))+ 0.2*(poch(j))+0.4*(rok(j))+0.8*(bag(j))
            end
        end      
    end
    end
end
for j = 1:1:50
    if j~=6
        if((moc(j)>600)||(moc(j)<400))
            if((bag(j)>700)||(bag(j)<500))
                if((pre(j)>400)||(pre(j)<200))
        B(j,1)= 1*(segment(j))+0*(naped(j))+0.9*(paliwo(j))+0.8*(nadwozie(j))+0.6*(moc(j))+0.3*(miejsca(j))+0.5*(poj(j))+0.7*(pre(j))+0*(bieg(j))+ 0.2*(poch(j))+0.4*(rok(j))+0.8*(bag(j))
                end
            end
        end
    end
end

C=A-B
SZUKANA1 = dane(6); %Jaguar XJ
szukana = cell2mat(SZUKANA1);
D=C-szukana
ilecech=10
ileproduktow=49
funkcje=zeros(ileproduktow,ilecech);
for ktory=1:5
    funkcje(ktory,1)=macierz(ktory,5);
    funkcje(ktory,2)=macierz(ktory,8);
    funkcje(ktory,3)=macierz(ktory,12);
    funkcje(ktory,4)=macierz(ktory,7);
    funkcje(ktory,5)=macierz(ktory,6);
    funkcje(ktory,6)=macierz(ktory,11);
    funkcje(ktory,7)=macierz(ktory,10);
    funkcje(ktory,8)=macierz(ktory,1)
    funkcje(ktory,9)=macierz(ktory,3);
    funkcje(ktory,10)=macierz(ktory,4);
end
for ktory=7:50
    funkcje(ktory-1,1)=macierz(ktory,5);
    funkcje(ktory-1,2)=macierz(ktory,8);
    funkcje(ktory-1,3)=macierz(ktory,12);
    funkcje(ktory-1,4)=macierz(ktory,7);
    funkcje(ktory-1,5)=macierz(ktory,6);
    funkcje(ktory-1,6)=macierz(ktory,11);
    funkcje(ktory-1,7)=macierz(ktory,10);
    funkcje(ktory-1,8)=macierz(ktory,1)
    funkcje(ktory-1,9)=macierz(ktory,3);
    funkcje(ktory-1,10)=macierz(ktory,4);
end

ilepodzbiorow=8;
funkcje_celu=zeros(ilepodzbiorow,ileproduktow);
wagi=[0.6,0.7,0.8,0.5,0.3,0.4,0.2,1,0.9,0.8] 

szukany_produkt_cechy=[macierz(6,5),macierz(6,8),macierz(6,12),macierz(6,7),macierz(6,6),macierz(6,11),macierz(6,10),macierz(6,1),macierz(6,3),macierz(6,4)]
odleglosci_euklidesowe=zeros(ilepodzbiorow,ileproduktow);
for ktory_podzbior=1:ilepodzbiorow
    for ktory_produkt=1:ileproduktow
        ile_teraz_cech=ktory_podzbior+2;
        for ktora_cecha=1:ile_teraz_cech
            odleglosci_euklidesowe(ktory_podzbior,ktory_produkt)=odleglosci_euklidesowe(ktory_podzbior,ktory_produkt)+((funkcje(ktory_produkt,ktora_cecha)-szukany_produkt_cechy(ktora_cecha))^2);
        end
        odleglosci_euklidesowe(ktory_podzbior,ktory_produkt)=sqrt(odleglosci_euklidesowe(ktory_podzbior,ktory_produkt))
        if odleglosci_euklidesowe(ktory_podzbior,ktory_produkt)>50
           odleglosci_euklidesowe(ktory_podzbior,ktory_produkt)=999999;
        end
    end
end
min_odleglosci_produktow_w_podzbiorze=zeros(ilepodzbiorow);
najlepszy_produkt_w_podzbiorze=1;
for ktory_podzbior=1:ilepodzbiorow
    for ktory_produkt=1:ileproduktow
        if odleglosci_euklidesowe(ktory_podzbior,ktory_produkt)<=odleglosci_euklidesowe(ktory_podzbior, najlepszy_produkt_w_podzbiorze)
            najlepszy_produkt_w_podzbiorze=ktory_produkt;
            min_odleglosci_produktow_w_podzbiorze(ktory_podzbior)=odleglosci_euklidesowe(ktory_podzbior,najlepszy_produkt_w_podzbiorze)
        end
    end
end
najlepszy_podzbior=1;
for ktory_podzbior=1:ilepodzbiorow
    if min_odleglosci_produktow_w_podzbiorze(ktory_podzbior)<=min_odleglosci_produktow_w_podzbiorze(najlepszy_podzbior)
        najlepszy_podzbior=ktory_podzbior
        optymalna_odleglosc_wewnatrz_podzbiorow=min_odleglosci_produktow_w_podzbiorze(najlepszy_podzbior)
    end
end   
optymalne_funkcje_celu=zeros(ileproduktow);
optymalny_produkt=1;
moc=funkcje(:,1)
predkosc=funkcje(:,2)
bagaznik=funkcje(:,3)
for ktory_produkt=1:ileproduktow
    if (moc(ktory_produkt)>=400) && (moc(ktory_produkt)<=600) 
        if (predkosc(ktory_produkt)>=200) && (predkosc(ktory_produkt)<=400) 
            if (bagaznik(ktory_produkt)>=500) && (bagaznik(ktory_produkt)<=700) 
                if odleglosci_euklidesowe(najlepszy_podzbior,ktory_produkt)~=999999
                    optymalne_funkcje_celu(ktory_produkt)=wagi(1)*moc(ktory_produkt)+wagi(2)*predkosc(ktory_produkt)+wagi(3)*bagaznik(ktory_produkt)
                    optymalny_produkt=ktory_produkt
                end
            end
        end
    end
end





