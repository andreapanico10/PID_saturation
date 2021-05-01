c=0.1;
X=0;
Y=0;
Kp=0.37;
Ki=0.036;
Kd=0.9;
N=5;


simOut=sim('usato.slx');
time=u(:,1);

    X=u(:,2);
    Y=u2(:,2);
  
       X2=u1(:,2);
       Y2=u3(:,2);
       Qpi=q_pi_sigma(:,2);
       Qpd=q_pdsigma(:,2);
       
       Q_i_p=q_isigma(:,2);
       Q_i_p_d=q_i_psigma(:,2);
  
       Q_i_d=q_isigma3(:,2);
       Q_i_d_p=q_i_dsigma3(:,2);
       
       Q_d_p=q_dsigma(:,2);
       Q_d_p_i=q_d_psigma(:,2);
       
       Q_d_i=q_dsigma1(:,2);
       Q_d_i_p=q_d_isigma1(:,2);
        
       C2=c2(:,2);
       C2k10=c2k10(:,2);
       C2k2=c2k2(:,2);
       C2k3=c2k3(:,2);
       C2k05=c2k05(:,2);
       C2k02=c2k02(:,2);
       C2k075=c2k075(:,2);
       
       C2pk01=c2pk01(:,2);
       C2pk02=c3pk02(:,2);
       C2pk05=c2pk05(:,2);
       C3pk05=c3pk05(:,2);
       C2pk2=c2pk2(:,2);
       C3pk2=c3pk2(:,2);
       C2pk26=c2pk26(:,2);
       C3pk26=c3pk26(:,2);
       
       C2pd01=c2pd01(:,2);
       C2pd001=c2pd001(:,2);
       C2pd10=c2pd10(:,2);
       C2pd0001=c2pd0001(:,2);
       C2pd003=c2pd003(:,2);