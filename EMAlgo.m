% function EMAlgo(K, epsilon, X)
fig = double(imread('./pic/Input_sample.jpg'));%读取图片
c1 = fig(:,:,1);
c2 = fig(:,:,2);
c3 = fig(:,:,3);
X = [c1(:),c2(:),c3(:)]; %X变量中，每一行是一个像素
K =2;
epsilon = 1e-5;

% 以下代码根据Automatic Corneal Ulcer Segmentation Combining Gaussian Mixture
% Modeling and Otsu Method中的伪代码改写

% Initialization
[N, dim] = size(X);% N个dim维度的像素
t = 0; %迭代次数

% tau, mu,sigma为待估计的参数，这里我用了多维矩阵存储，相比struct,cell要节省资源
tau = 1/K * ones(1,K);% Mixing coefficient  
mu = randi(255,dim,K) .* ones(dim, K);% 初始化mu
sigma = zeros(dim, dim, K);
for i = 1:K
    sigma(:,:,i) = 100 * eye(dim,dim);%初始化sigma
end

rnk = 0.5 * ones(N, K); %初始化后验概率（posterior probability）
% 多变量高斯函数,这里用了一个内联函数
guass_fun = @(x, mu, sigma) exp(-1/2 * (x-mu).*(inv(sigma)*(x-mu)')')/sqrt((2*pi)^size(x,2)*det(sigma));
%当前对数似然函数值，LogLikelihood函数定义在文档最下面
llh = LogLikelihood(X, tau, mu, sigma, guass_fun);

while true
    t = t + 1;
    % E step
    for class = 1:K
        rnk(:, class) = sum(guass_fun(X, mu(:, class)', sigma(:, :, class)),2);
    end
    rnk = (rnk.*tau)./sum(rnk.*tau, 2);
    
    
    % M step
    for class = 1:K
        mu(:,class) = (sum(rnk(:, class).*X, 1)./sum(rnk(:, class)))';
        zeroMean = (X-mu(:,class)');
        sigma(:,:,class) = (zeroMean' * (zeroMean .* rnk(:,class)))./sum(rnk(:,class));
    end
    tau = sum(rnk)./N;
    
    % 打印结果
    disp(['+++++++++++ iteration ',num2str(t),'++++++++++++'])
    disp(['tau: ', num2str(tau)])
    disp('mu: ')
    disp(num2str(mu))
    disp('sigma: ')
    disp(num2str(sigma))
    
    % 退出循环条件
    llh_new = LogLikelihood(X, tau, mu, sigma, guass_fun);
    if (llh_new - llh)<=epsilon %当似然函数不再有提升时，退出
        break;
    end
    llh = llh_new;
    
    if(t>100)% 或者当迭代次数超过上限时，退出
        break
    end
  
end

% TODO: 测试分割效果

% end

%% 最大似然函数
function result = LogLikelihood(X, tau, mu, sigma, fcnHandle)
% 该函数用来计算log-likelihood given in Eq. (4)。
% 传入的fcnHandle是多变量高斯函数
    k = length(tau);% 有多少类
    [n, ~] = size(X);
    p = zeros(n, k);% 每一个像素点的概率
    for j = 1:k
        p(:,j) = sum(tau(j) * fcnHandle(X, mu(:,j)', sigma(:,:,j)), 2);
    end
    result = sum(log(p));
end