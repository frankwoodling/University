%%
disp('frozenSensorTest1')
sensor_data= [ ...
  -16     9    66;
    19     6    58;
   -20     3    55;
    11     5    58;
    13     4    52;
    15     0    52;
   -17     2    69;
    -4     1    70;
   -10     2    62;
    12     2    51;
    -3     4    54;
    17     0    57;
   -13     9    67;
   -10    10    50;
   -15     5    50;
   -15     5    53;
    15     3    63;
     3     9    65;
     2     4    63;
   -15     1    59   ];
thresholds =[0,5,60];
cleaned_data=[...
      -16    9   66 ;
       19    6   58 ;
      -20    3   55 ;
       11    5   58 ;
       13    4   52 ;
       15    0   52 ;
       12    2   51 ;
       -3    4   54 ;
       17    0   57 ;
      -13    9   67 ;
      -10   10   50 ;
      -15    5   50 ;
      -15    5   53 ;
       15    3   63 ;
        3    9   65 ;
        2    4   63 ;
      -15    1   59 ];
discarded_data=[ ...
     -17    2   69 ;
      -4    1   70 ;
     -10    2   62 ];

data_out= frozenSensor(sensor_data,thresholds);
assert( all(all(data_out{1}==cleaned_data))  && ...
    all( all( data_out{2}==discarded_data ) ) , ...
    [ '\nYour output \ndata{1} = [\n' sprintf('%5d%5d%5d \n',data_out{1}') ']\n\n' ...
      'Expected output \ncleaned data = [\n'  sprintf('%5d%5d%5d \n',cleaned_data')  ']\n' ], ...
      data_out{1},cleaned_data);
%%
disp('frozenSensorTest2')
sensor_data= [ ...
    -9     9    70;
    20     6    68;
    -3     7    66;
     3     5    50;
     1     9    70;
   -12     0    60;
   -14     8    54;
     0     1    68;
    20     0    54;
    -4     0    52;
     9     0    65;
   -13     5    70;
   -18     4    61;
   -14    10    59;
   -14     1    50;
    -9     3    62;
     2    10    70;
    11     4    70;
    16     9    69;
     6     6    53  ];
thresholds =[0,5,60];
cleaned_data=[...
   -9    9   70 ;
   20    6   68 ;
   -3    7   66 ;
    3    5   50 ;
    1    9   70 ;
  -14    8   54 ;
   20    0   54 ;
   -4    0   52 ;
    9    0   65 ;
  -14   10   59 ;
  -14    1   50 ;
    2   10   70 ;
   11    4   70 ;
   16    9   69 ;
    6    6   53  ];
discarded_data=[ ...
  -12    0   60 ;
    0    1   68 ;
  -13    5   70 ;
  -18    4   61 ;
   -9    3   62 ];

data_out= frozenSensor(sensor_data,thresholds);
assert( all(all(data_out{1}==cleaned_data))  && ...
    all( all( data_out{2}==discarded_data ) ) , ...
    [ '\nYour output \ndata{1} = [\n' sprintf('%5d%5d%5d \n',data_out{1}') ']\n\n' ...
      'Expected output \ncleaned data = [\n'  sprintf('%5d%5d%5d \n',cleaned_data')  ']\n' ], ...
      data_out{1},cleaned_data);
%%
disp('frozenSensorTest3')
sensor_data= [ ...
   16     6    55;
    -2     8    50;
   -10     6    66;
    13     8    57;
     8    10    68;
    -4     8    67;
   -20     6    70;
    19     1    70;
     4     5    62;
   -20     3    56;
     1     1    69;
     4     8    51;
    -8     0    54;
    -2     0    57;
     0     7    58;
     4     5    69;
    15     4    62;
    14     3    53;
    11     0    62;
     2     3    69  ];
thresholds =[0,5,60];
cleaned_data=[...
    16     6    55;
    -2     8    50;
   -10     6    66;
    13     8    57;
     8    10    68;
    -4     8    67;
   -20     6    70;
    19     1    70;
     4     5    62;
   -20     3    56;
     1     1    69;
     4     8    51;
    -8     0    54;
    -2     0    57;
     0     7    58;
     4     5    69;
    15     4    62;
    14     3    53;
    11     0    62;
     2     3    69   ];
discarded_data=[ ];

data_out= frozenSensor(sensor_data,thresholds);
assert( all(all(data_out{1}==cleaned_data)) && ...
    isempty(data_out{2})  , ...
    [ '\nYour output \ndata{1} = [\n' sprintf('%5d%5d%5d \n',data_out{1}') ']\n\n' ...
      'Expected output \ncleaned data = [\n'  sprintf('%5d%5d%5d \n',cleaned_data')  ']\n' ], ...
      data_out{1},cleaned_data);