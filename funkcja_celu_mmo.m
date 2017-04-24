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
                        funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
                    end
                end
            end
        end
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
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
                        funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
                    end
                end
            end
        end
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
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
                    funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
                end
            end
        end
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
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
                    funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
            end
        end
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
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
              funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
        end
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
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
            funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
          end
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
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
            funkcje_celu(i)=moc(i)+silnik(i)+bagaznik(i)+predkosc(i)+miejsca(i)+rok(i)+rejestracja(i);
      end
   end
end
liczba_trafien=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        liczba_trafien=liczba_trafien+1;
    end
end
liczba_trafien
pasujace_samochody=cell(liczba_trafien,1);
j=0;
for i=1:50
    if (funkcje_celu(i)~=0)
        j=j+1;
        pasujace_samochody(j)=samochody(i);
    end
end
pasujace_samochody

% ETYKIETOWANIE CECH %
disp('Nadane sa wagi dla poszczegolnych cech');


