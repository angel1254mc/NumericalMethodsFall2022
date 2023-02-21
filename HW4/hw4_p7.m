clc; clear;
m_i = [2 2 0 3;
       0 0 2 1;
       0 1 0 0;
       1 0 1 0;];

m_2 = [29; 5; 8; 3];

final_answer = m_2\m_i;
disp("Result from performing left-matrix division on the two matrices");
disp(final_answer);