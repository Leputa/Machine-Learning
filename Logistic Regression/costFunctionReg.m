function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
R=0
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


for i=1:m
	J=J+y(i)*log(sigmoid(theta'*X(i,:)'))+(1-y(i))*log(1-sigmoid(theta'*X(i,:)'));
end
for j=2:size(theta,1)
	R=R+theta(j)'*(theta(j));
end
J=-J/m+R*lambda/(2*m);

%J = 1/m * (-y' * log(sigmoid(X*theta)) - (1 - y') * log(1 - sigmoid(X * theta))) + lambda/2/m*sum(theta(2:end).^2);


grad=X'*(sigmoid(X*theta)-y)/m;
theta(1)=0
grad=grad+lambda*theta/m;

%newtheta=[0;theta(2:end)];
%grad=(X'*(sigmoid(X*theta)-y))/m+lambda*newtheta/m;

%grad(1,:) = 1/m * (X(:, 1)' * (sigmoid(X*theta) - y));
%grad(2:size(theta), :) = 1/m * (X(:, 2:size(theta))' * (sigmoid(X*theta) - y))+lambda/m*theta(2:size(theta), :);

% =============================================================

end
