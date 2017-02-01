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
    if((moc(j)<500)&&(moc(j)>450))
        if((bag(j)<600)&&(bag(j)>500))
            if((pre(j)<300)&&(pre(j)>250))
    A(j,1)= 1*(segment(j))+0*(naped(j))+0.9*(paliwo(j))+0.8*(nadwozie(j))+0.6*(moc(j))+0.3*(miejsca(j))+0.5*(poj(j))+0.7*(pre(j))+0*(bieg(j))+ 0.2*(poch(j))+0.4*(rok(j))+0.8*(bag(j))
            end
        end      
    end
    end
end
for j = 1:1:50
    if j~=6
    if((moc(j)>500)||(moc(j)<450))
        if((bag(j)>600)||(bag(j)<500))
            if((pre(j)>300)||(pre(j)<250))
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

moc = macierz(:,5)
pre = macierz(:,8)
bag = macierz(:,12)

opt=zeros(kol,1);
for j=1:1:50
	if j~=6
		opt(j)=0.6*(moc(j))+0.7*(pre(j))+0.8*(bag(j))
	end 
end

opt_sort=sort(opt);
sortA=sort(A);
sortB=sort(B);


