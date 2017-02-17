Aeq=[2+pi/2 2];
beq=3;
punkt_startowy=[0,0];
options=optimset('LargeScale','off');
lb=[0 0];
ub=[0.84 1.5];

[rozmiary_okna,max_przestrzen]=fmincon(@funkcja_celu,punkt_startowy,[],[],Aeq,beq,lb,ub);

max_przestrzen=-max_przestrzen
Xopt=rozmiary_okna(1)
Yopt=rozmiary_okna(2)
