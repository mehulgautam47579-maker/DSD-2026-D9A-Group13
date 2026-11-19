# 02 – FSM and Logisim
Present state Q	 START	ACK	 V_COMB	 Next Q⁺	VALID	 INVALID
0 (IDLE)	         0	  x	     x	       0	    0	     0
0 (IDLE)	         1	  x	     x         1      0	     0
1 (ACTIVE)	       x	  1	     x	       0	    0	     0
1 (ACTIVE)	       x	  0	     1	       1	    1	     0
1 (ACTIVE)	       x	  0	     0	       1	    0	     1


Excitation and output equations:
Q⁺ = Q’·START + Q·ACK’
VALID = Q·ACK’·V_COMB
INVALID = Q·ACK’·V_COMB’

<img width="1920" height="1080" alt="cd" src="https://github.com/user-attachments/assets/e19934a7-16d4-41fa-9340-92a796b29a04" />

<img width="1320" height="724" alt="a" src="https://github.com/user-attachments/assets/5f5ff79d-409c-4e9b-92d3-3098a547311c" />
<img width="1320" height="728" alt="b" src="https://github.com/user-attachments/assets/08f85e22-52a1-4643-93f1-d2b9187e7aec" />
<img width="1320" height="736" alt="c" src="https://github.com/user-attachments/assets/a1a79a64-ab9a-41df-adec-9cec0412cb0d" />
<img width="1320" height="741" alt="d" src="https://github.com/user-attachments/assets/1211cd1b-7a16-4bf0-a64f-2cee40c43979" />
<img width="1320" height="739" alt="e" src="https://github.com/user-attachments/assets/a3d9d1e4-4378-4397-bc4d-be470bf8a69f" />


