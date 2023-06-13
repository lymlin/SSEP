data4(Ts<15,:) = smoothdata(data2(Ts<15,:),"gaussian",250);
StimArtifactTime = intersect(find(Ts>-15),find(Ts<14));
data4(StimArtifactTime,:) = 1e-1.*data2(StimArtifactTime,:);
data4(Ts<15,:) = smoothdata(data4(Ts<15,:),"gaussian",200);
data5 = smoothdata(data4,"movmean",100);