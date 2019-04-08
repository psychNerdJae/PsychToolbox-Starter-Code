function [sampledValue] = boundedUniform(minValue, maxValue)

sampledValue = minValue + (maxValue-minValue) .* rand;

end