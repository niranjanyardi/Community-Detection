F = dir('*.egonet');

% load files
temp2= [];
% for ii = 1:length(F)
%    temp1 = load(F(ii).name);
% end

%
for ii = 1:length(F)
  load(F(ii).name);
end

% concatenate files
% for ii = 1:26
%    temp2 = [temp1; temp2];
% end
% temp = temp2(1:28680 , :);

mat= [aa];

minus = mat(1,1)-1;
size1= size(mat);

for i= 1:size1(1)
mat(i,1)=mat(i,1)-minus;
mat(i,2)=mat(i,2)-minus;
end

output=[];
l=1;
k=mat(size(mat));
% k=228;
num=k-l+1;
cnt=0;
for j =l:k
cnt1=cnt+1;
u = zeros(num,1);

for i = l : num
%     if (aa(i,2)== 0)
        u(i,1)=j;   %%user id
        u(i,2)=i;  %%serial no
        u(i,3)=NaN; 
%     end
end

w=u;
i=0;

for i = 1 : num
    if (mat(i,1) == j)  % i.e  if it is the jth user id
%     if (aa(i,2)== 0)
        u(mat(i,2),3)= mat(i,3);
%     end
    end
end

%This is the new cut matrix
u1= u(j+1:k ,:);

output= [output ; u1];

end

o=output(:,3);

Z1 = linkage(o');
c = cluster(Z1,'maxclust',5);
hist(c);




