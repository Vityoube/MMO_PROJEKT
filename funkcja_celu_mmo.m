filedata='MMO.xlsx';
sheet=1;
xlRange='A2:H51';
[num,text,raw]=xlsread(filedata,sheet,xlRange);

samochody=raw(1:50,1);

moc=cell2mat(raw(1:50,2));
silnik=cell2mat(raw(1:50,4));
predkosc=cell2mat(raw(1:50,5));
bagaznik=cell2mat(raw(1:50,7));
miejsca=cell2mat(raw(1:50,3));
rok=cell2mat(raw(1:50,6));
rejestracja=cell2mat(raw(1:50,8));

max_moc=max(moc)
max_silnik=max(silnik)
max_predkosc=max(predkosc)
max_bagaznik=max(bagaznik)
max_miejsca=max(miejsca)
max_rok=max(rok)
max_rejestracja=max(rejestracja)

moc_funkcja=zeros(50);
silnik_funkcja=zeros(50);
predkosc_funkcja=zeros(50);
bagaznik_funkcja=zeros(50);
miejsca_funkcja=zeros(50);
rok_funkcja=zeros(50);
rejestracja_funkcja=zeros(50);

for i=1:50
    moc_funkcja(i)=moc(i)/max_moc;
    silnik_funkcja(i)=silnik(i)/max_silnik;
    predkosc_funkcja(i)=predkosc(i)/max_predkosc;
    bagaznik_funkcja(i)=bagaznik(i)/max_bagaznik;
    miejsca_funkcja(i)=miejsca(i)/max_miejsca;
    rok_funkcja(i)=max_rok/rok(i);
    rejestracja_funkcja(i)=rejestracja(i)/max_rejestracja;
end


%   POSZUKIWANIE OPTYMALNYCH ROZWIAZAN %

funkcje_celu=zeros(50);
disp('Uwzgledniono ograniczenia na silnik,moc, predkosc, bagaznik, miejsca, rok i tablicę rejestracyjna');
for i=1:50
   if i~=1
      if silnik(i)<3
        if (moc(i)<250) && (predkosc(i)<250)
            if bagaznik(i)<300
                if miejsca(i)>3 && miejsca(i)<7
                    if rejestracja(i)>2 && rejestracja(i)<20
                        funkcje_celu(i)=(moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
                    end
                end
            end
        end
      end
   end
end
liczba_trafien=zeros(7);
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(7)=liczba_trafien(7)+1;
    end
end
liczba_trafien(7)
pasujace_samochody=cell(liczba_trafien(6),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody

funkcje_celu=zeros(50);
disp('Uwzgledniono ograniczenia na silnik,moc, predkosc, bagaznik, miejsca, rok');
for i=1:50
   if i~=1
      if silnik(i)<3
        if (moc(i)<250) && (predkosc(i)<250)
            if bagaznik(i)<300
                if miejsca(i)>3 && miejsca(i)<7
                    if rok(i)>2008 && rok(i)<2016
                        funkcje_celu(i)=(moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
                    end
                end
            end
        end
      end
   end
end
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(6)=liczba_trafien(6)+1;
    end
end
liczba_trafien(6)
pasujace_samochody=cell(liczba_trafien(6),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody

funkcje_celu=zeros(50);
disp('Uwzgledniono ograniczenia na silnik,moc, predkosc, bagaznik i miejsca');
for i=1:50
   if i~=1
      if silnik(i)<3
        if (moc(i)<250) && (predkosc(i)<250)
            if bagaznik(i)<300
                if miejsca(i)>3 && miejsca(i)<7
                    funkcje_celu(i)=(moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
                end
            end
        end
      end
   end
end
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(5)=liczba_trafien(5)+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien(5),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody

disp('Uwzgledniono ograniczenia na silnik,moc, predkosc, bagaznik');
funkcje_celu=zeros(50);
for i=1:50
   if i~=1
      if silnik(i)<3
        if (moc(i)<250) && (predkosc(i)<250)
            if bagaznik(i)<300
                    funkcje_celu(i)=(moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
            end
        end
      end
   end
end
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(4)=liczba_trafien(4)+1;
    end
end
liczba_trafien(4)
pasujace_samochody=cell(liczba_trafien(4),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody

disp('Uwzgledniono ograniczenia na silnik,moc, predkosc');
funkcje_celu=zeros(50);
for i=1:50
   if i~=1
      if silnik(i)<3
        if (moc(i)<250) && (predkosc(i)<250)
           funkcje_celu(i)= (moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
        end
      end
   end
end
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(3)=liczba_trafien(3)+1;
    end
end
liczba_trafien(3)
pasujace_samochody=cell(liczba_trafien(3),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody


disp('Uwzgledniono ograniczenia na silnik,moc');
funkcje_celu=zeros(50);
for i=1:50
   if i~=1
      if silnik(i)<3
          if (moc(i)<250)
            funkcje_celu(i)=(moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
          end
      end
   end
end
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(2)=liczba_trafien(2)+1;
    end
end
liczba_trafien(2)
pasujace_samochody=cell(liczba_trafien(2),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody


disp('Uwzgledniono ograniczenia na silnik');
funkcje_celu=zeros(50);
for i=1:50
   if i~=1
      if silnik(i)<3
            funkcje_celu(i)=(moc_funkcja(i)+silnik_funkcja(i)+bagaznik_funkcja(i)+predkosc_funkcja(i)+miejsca_funkcja(i)+rok_funkcja(i)+rejestracja_funkcja(i))/7;
      end
   end
end
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien(1)=liczba_trafien(1)+1;
    end
end
liczba_trafien(1)
pasujace_samochody=cell(liczba_trafien(1),1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody

opt_ilosc_ograniczen=100500;
for i=1:7
   if liczba_trafien(i)<20 && liczba_trafien(i)>5 && opt_ilosc_ograniczen>liczba_trafien(i)
       opt_ilosc_ograniczen=i;
    end
end
fprintf('optymalna ilosc ograniczen: %d\n',opt_ilosc_ograniczen);

% ETYKIETOWANIE CECH %
disp('Nadane sa wagi dla poszczegolnych cech');

waga=1/7;

for i=1:50
    if i~=1
        switch opt_ilosc_ograniczen 
            case 1
                if silnik(i)<3
                 funkcje_celu(i)=(waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                end
            case 2
             if silnik(i)<3
                  if (moc(i)<250)
                    funkcje_celu(i)=(waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                  end
              end
        
            case 3
             if silnik(i)<3
                if (moc(i)<250) && (predkosc(i)<250)
                   funkcje_celu(i)= (waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                end
             end
            case 4
                if silnik(i)<3
                    if (moc(i)<250) && (predkosc(i)<250)
                        if bagaznik(i)<300
                                funkcje_celu(i)=(waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                        end
                    end
                end
            case 5
               if silnik(i)<3
                if (moc(i)<250) && (predkosc(i)<250)
                    if bagaznik(i)<300
                        if miejsca(i)>3 && miejsca(i)<7
                            funkcje_celu(i)=(waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                        end
                    end
                end
               end
            case 6
                if silnik(i)<3
                    if (moc(i)<250) && (predkosc(i)<250)
                        if bagaznik(i)<300
                            if miejsca(i)>3 && miejsca(i)<7
                                if rok(i)>2008 && rok(i)<2016
                                    funkcje_celu(i)=(waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                                end
                            end
                        end
                    end
                end
            case 7
                 if silnik(i)<3
                    if (moc(i)<250) && (predkosc(i)<250)
                        if bagaznik(i)<300
                            if miejsca(i)>3 && miejsca(i)<7
                                if rejestracja(i)>2 && rejestracja(i)<20
                                    funkcje_celu(i)=(waga*moc_funkcja(i)+waga*silnik_funkcja(i)+waga*bagaznik_funkcja(i)+waga*predkosc_funkcja(i)+waga*miejsca_funkcja(i)+waga*rok_funkcja(i)+waga*rejestracja_funkcja(i))/7;
                                end
                            end
                        end
                    end
                  end
        end
    end
end

disp('Z uwzględnieniem wag: ');
funkcje_celu

wzorzec=(waga*moc_funkcja(1)+waga*silnik_funkcja(1)+waga*bagaznik_funkcja(1)+waga*predkosc_funkcja(1)+waga*miejsca_funkcja(1)+waga*rok_funkcja(1)+waga*rejestracja_funkcja(1))/7;
disp('Wzorzec: ');
wzorzec
samochody(1)

% Odnalezienie optymalnego zestawu cech
disp('Odnalezienie optymalnego zestawu cech');


