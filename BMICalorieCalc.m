function [BMI, BMR, TDEE] = BMICalorieCalc(userHeight, userWeight, sex, ...
    age, activityLevel, units)
%% BMI and Calorie Calculator
% Inputs: Height(ft/cm), Weight(lb/kg), Age(years), Sex('male' or 
% 'female'), Activity level, units
% Outputs: BMI, BMR, Estimated daily calories
            
%Input Validation
if any([userHeight, userWeight, age]) == 0
    BMI = NaN;
    BMR = NaN;
    TDEE = NaN;
    return
end


%BMI Calculation
BMI = userWeight / ((userHeight/100).^2);


%BMR Calculation
if strcmpi(sex, 'female')
    BMR = 447.593 + (9.247 * userWeight) + (3.098 * userHeight) - (4.330 * age);
else
    BMR = 88.362 + (13.397 * userWeight) + (4.799 * userHeight) - (5.677 * age);
end


%TDEE Calculation
switch activityLevel
    case 'Sedentary'
        TDEE = BMR * 1.2;
    case 'Lightly active'
        TDEE = BMR * 1.375;
    case 'Moderately active'
        TDEE = BMR * 1.55;
    case 'Very active'
        TDEE = BMR * 1.725;
    case 'Super active'
        TDEE = BMR * 1.9;
end

end