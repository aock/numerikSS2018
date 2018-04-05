function y = ex02(a,b,c)
    y = round(a + round(b + c)) ~= round(round(a + b) + c);
end
