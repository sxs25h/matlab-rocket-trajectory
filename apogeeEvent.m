function [value,isterminal,direction] = apogeeEvent(~,y)

% APOGEEEVENT Stops integration at maximum altitude.
%  apogee occurs when vertical velocity crosses zero downward.

value=y(2);
isterminal= 1;
direction= -1;
end
