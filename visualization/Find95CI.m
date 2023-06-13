function CIpair = Find95CI(ArrayInput)


    ArrayInput = reshape(ArrayInput,[],[1]);
    pd = fitdist(ArrayInput,"Normal");
    ci = paramci(pd);
    CIpair = ci(:,1);


end