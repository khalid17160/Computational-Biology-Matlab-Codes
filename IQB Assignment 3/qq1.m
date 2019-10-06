%% Que #1

%Compute frequencies of various pairs of bases appearing at  same site in two DNA sequences. 
% Construct 4x4 arraysequence table, with bases in seq1(So)alongtop, seq2 (S1) along side, 
% in order A,G,C,T.
% (b) display the fraction of sites with each base in S0 from sequence table in (a).
% (c) display the fraction of sites with each base in S1.(d) display the conditional 
% probability from the sequence table


S0e = 'CGGCCTGAAGCGACGTCGTATCATATCAATCGCATGTCATCGCCGTCTACGCCCCGGAGACTAAACCCTGCCGCATGATAATGTGGTCTACTGAGTTCTTCATGGGGCAGGGGATCATGAATCGTGCAAGACCCAAGCCCCTACCAAAGAGACCACGAGGTCATTAGTCTTCCTAGGCGACTAGTTCTGTCGCGCTCTCACCATTTCTTCTCATGGGGAACTCAGAACTGGATGAATGTCCCTTAGACCCTGTTTTCCTCGCGTGAAAAAGTACCTTTTAGAGCATTCAAATATGTCGACCGAAGAACCTGTAGTTAAATCCGTCGCATTAACTCTTAGAGGGCCGGAGCTAAGACCAAGTCTATCACGCGCGCTCAAACATGAGGGAGATTGGTCCATTTGTGGGAGATTAGCCAAGCATCATGGAACTACCTCTTTCCATACAATTTCGGCCTTGCCATATTCCATTTAATGAAAGCTACGCCTCGAGCCGTTAAGCCCGTCAATAGAACTGGTTACCTAAGGCCAGTACCAACGGAATGGCTGGAGGTCGCGCCACGAATATGGTGCCTTTTTCCTGTAGCTCGTGTCGGCCGAAGA';
S1e ='AGGCGTCAAGTGTCGGCGGGGCATATTAATGGCGTGTTGCTAAGCTGGACAGTCAAAGTGCCCAACTCAGCTGCGCCGCAGCGTATTCCGACGGCTTCTCCATGAGGGAAAAGATCGCAAAACGGGTAAGTTTTAAATTTGTAATAATAAGACGATTTGCCAACTGGTCCCGAAAGGGGAATGAGTTTGCCACAGACCCCCTGTCTGTTCGTCCCAAAAATCAGGGTCCAGATGAGTTGTACCTGAGGGTCCATTTCTTCTTTTAGCTGATTGATTCCCGGATGACCCCTACGTGTCGCTCAGAAAGACAGTACGTCGACGCGTCACCTTAACATAGGGGTTGCCCAGGCCCGGCCCTAACCGAATTGGCATCCACAAACATAGGAAAGATTGATCCAATAAAAAGAAATCAGCCGCGTACCATTATGTTAGCTATATCTGGGCATTGGCGTCCGTGCCGTCCTTTGACTAATAACGGTTACTCCCCAAGCAGTTATACCGGTGGGCAAAACTGGTCGATGGACTCGGCGGTGAATAGTCCGATCGGCGCACACGCCATGAGCAGGATGCATTCTTCCTGTAACCTGTGACAACTGCGGG';

S0=split(S0e,"");
S0=S0';
S1=split(S1e,"");
S1=S1';
M=zeros(4,4);

%% Calculating frequency matrix 
% M is the frequency Matrix
for i=2:length(S0)-1
    if S0(i)=="A"
        if S1(i)=="A"
            M(1,1)=M(1,1)+1;
        elseif S1(i)=="G"
            M(2,1)=M(2,1)+1;
        elseif S1(i)=="C"
            M(3,1)=M(3,1)+1;
        elseif S1(i)=="T"
            M(4,1)=M(4,1)+1;
        end
    elseif S0(i)=="G"
        if S1(i)=="A"
            M(1,2)=M(1,2)+1;
        elseif S1(i)=="G"
            M(2,2)=M(2,2)+1;
        elseif S1(i)=="C"
            M(3,2)=M(3,2)+1;
        elseif S1(i)=="T"
            M(4,2)=M(4,2)+1;
        end
    elseif S0(i)=="C"
        if S1(i)=="A"
            M(1,3)=M(1,3)+1;
        elseif S1(i)=="G"
            M(2,3)=M(2,3)+1;
        elseif S1(i)=="C"
            M(3,3)=M(3,3)+1;
        elseif S1(i)=="T"
            M(4,3)=M(4,3)+1;
        end
    elseif S0(i)=="T"
        if S1(i)=="A"
            M(1,4)=M(1,4)+1;
        elseif S1(i)=="G"
            M(2,4)=M(2,4)+1;
        elseif S1(i)=="C"
            M(3,4)=M(3,4)+1;
        elseif S1(i)=="T"
            M(4,4)=M(4,4)+1;
        end
    end    
end
disp(" >>> Frequency Matrix");
disp(M);
%% frequency of a g c t in S0 (f0)
S0a=sum(M(:,1));
S0g=sum(M(:,2));
S0c=sum(M(:,3));
S0t=sum(M(:,4));

f0=[S0a S0g S0c S0t];

fracti0= f0/sum(f0);
disp(" >>> the fraction of sites with each base in S0 from sequence table");
disp(f0);
disp(fracti0);

%% frequency of a g c t in S1 (f1)
S1a=sum(M(1,:));
S1g=sum(M(2,:));
S1c=sum(M(3,:));
S1t=sum(M(4,:));

f1=[S1a S1g S1c S1t];

fracti1=f1/sum(f1);
disp(" >>> the fraction of sites with each base in S1 from sequence table");
disp(f1);
disp(fracti1);
%% Calculate Conditional probability
% MC is the conditional Probability Matrix
MC=zeros(4,4);
MC(:,1)=M(:,1)/S0a;
MC(:,2)=M(:,2)/S0g;
MC(:,3)=M(:,3)/S0c;
MC(:,4)=M(:,4)/S0t;

disp(" >>> Conditional probability of sequence table");
disp(MC);
 
%% Que #2
% Q2. Write a MATLAB/PYTHON code to compute the following distances to 10 decimal digits for the above
%sequences (a) Jukes-Cantor (b) Kimura 2-parameter (c) Paralinear. Which of these is likely to be a better estimate
%of the number of substitutions per site that actually occurred? Explain.
%% Compute Juke Cantor Distance

A1 = diag(diag(M));
NDM= M-A1;              % Non diagnoal Matrix of M
p=sum(sum(NDM))/sum(sum(M));
distJC=vpa((-1*vpa(3/4,10))*vpa(log(1-4*vpa(p/3,10)),10),10);

disp(" >>> Jukes Cantor Distance ");
disp(distJC);
%% Compute Kimura 2 parameter distance

p1= (M(2,1)+M(1,2)+M(4,3)+M(3,4))/sum(sum(M));
p2= (M(1,3)+M(1,4)+M(2,3)+M(2,4)  +  M(3,1)+M(4,1)+M(3,2)+M(4,2))/sum(sum(M));
distKM=vpa((-1/2)*vpa(log(1-2*p1-p2),10)-(1/4)*vpa(log(1-2*p2),10),10);

disp(" >>> Kimura 2 parameter distance");
disp(distKM);
%% Compute Log det distance / parallilear

g0= prod(f0);
g1= prod(f1);
detM = det(M);

distLD= vpa((-1/4)*(log(detM)-(1/2)*log(g0*g1)),10);

disp("log det distance");
disp(distLD);

disp(" >>> The distance formula assumes that data are consistent with either the JC or K2P models.");
disp( "However, it may not be constitent as models are not elaborate or do not describe sequence properties carefully.");
disp("So better estimate is provided by log det distance formulate. That is because of hidden mutation which is betterly provided by this.")

%% Que #3
%Q3. Construct a makeup 4 × 4 Markov matrix M with all positive entries and an initial p0. Make sure the diagonal
%entries of M are the largest. ( a) Use a computer to observe that, after many time steps, pt = M t p0 appears to
%approach some equilibrium. Estimate the equilibrium vector as accurately as you can. Do you get an eigenvector of
%M with eigenvalue 1? (b) Use a computer to compute the eigenvectors and eigenvalues of M. Is 1 an eigenvalue?
%Is your estimate of the equilibrium close to its eigenvector? (C) Are your computations in part (b) consistent with
%the two theorems about Markov matrices that is discussed in the class?

%% MM is the Markov Matrix %% using MM instead of M as this variable has
% been used earlierly

MM=[0.7 0.1 0.1 0.1; 0.1 0.7 0.1 0.1; 0.1 0.1 0.7 0.1; 0.1 0.1 0.1 0.7];



disp(" >>> Markov Matrix " );
disp(MM);

p0 = [0.25; 0.25; 0.25; 0.25];        %% initial Matrix

disp(" >>> initail p0");
disp(p0);

copyp0=p0;

p1 = zeros(4,1);
t = 0;
tf = 0;
% computing equilibrium vector
while t ~= 1000
    p1=MM*p0;
    tf= isequal(p0,p1);
    p0=p1;
    t=t+1;
end
disp("we observe that after time steps, pt = Mt * p0 appears to reach some equilibrium vector, which is given here");
disp(" >>> Equilibrium Vector");
disp(p0);
disp(">>> Yes this is an eigenvector of MM with eigen value 1.")
% eigen vector and value of Markov Matrix
[V,D]= eig(MM);
disp(" >>> Eigen Vector and values");
disp (V);
disp("values")
disp(diag(D)');
disp(" >>> Yes 1 is a eigen value");
disp(">>> Yes its equilibrium is close to the eigen vector with value 1");
disp(" >>> yes. Markov matrix always has lmda1=1 as its largest eigenvalue and has all eigenvalues satisfying |lmda | <= 1 the eigenvector ");
disp (" coresponding to lmda1 has all non negative entries.");
disp(" and the markov matrix, all with +ve entries has 1 as a strictly dominant eigenvalue. There is only one eigen vector associated with lmda=1");
 %ros aevionics 