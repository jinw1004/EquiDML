clear;clc;
seed = 0;
rng(seed);

trnNum = 485;
tstNum = 486;
numClass = 971;

for trial = 1:10
    p = randperm(numClass);
    
    trnSp = p(1:trnNum);
    trnSg = p(1:trnNum);
    tstSp = p(trnNum+1:end);
    tstSg = p(trnNum+1:end);
    
    partition(trial).trnSp = trnSp;
    partition(trial).trnSg = trnSg;
    partition(trial).tstSp = tstSp;
    partition(trial).tstSg = tstSg;
    
end
save('partition_cuhk01_XQDA.mat', 'partition');