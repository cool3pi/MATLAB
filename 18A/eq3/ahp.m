function w = ahp(A)
% 计算矩阵A的特征向量

% 获取矩阵A的大小
[n, ~] = size(A);

% 计算特征值和特征向量
[V, D] = eig(A);

% 找到最大特征值的索引
[~, max_idx] = max(diag(D));

% 提取对应的特征向量
w = V(:, max_idx);

% 归一化特征向量
w = w / sum(w);
end