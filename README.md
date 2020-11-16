# MoWaTER 2020 Denver Water Project
![Denver Water logo](https://www.denverwater.org/sites/default/files/DW-Horizontal.png)

***Disclaimer:*** The data for this project is property of [Denver Water](https://www.denverwater.org/) and is not saved on this repository. The data was provided for the [MoWaTER](https://www.baylor.edu/mowater/) Summer program 2020. The Denver Water team consisted of Nathen Byford(Baylor University), Jacqueline Alexandra Evans(Baylor University), and Xi Le(Colorado School of Mines). 

*This README is a summary of our tech brief if you would like to read our full findings please take a look at our [tech brief file](https://github.com/nathenbyford/MoWaTER/blob/master/Summer2020_DW_TechBrief.pdf)!*

## Preamble
This project took a look at the data involved in water filtration at the *Denver Water* foothills filtration plant. Our project focused on looking at the water quality measuments for each of the filters at the plant. 3 of the filters had been changed in winter 2019. We wanted to look and see if replacing the filter made a significant difference in the quality of water and effectivness of the filter.

### Data
The data given to us by denver water was construced of the data and time, head loss, total effluent flow, turbitity, and filter runtime of each observation.
Data was recorded in 5 minute intervals for each filter. Turbidity is measured in NTU, which is a measure of water clarity, so the clearer the water, the lower the turbidity. Head loss is a measure filter efficiency, head loss is the amount of energy lost from pushing the water through the filter. Total effluent flow is the total amount of water flowing through each filter. Filter runtime is the length of time the filter was running since it's last cleaning cycle.

## Exploratory Data Analysis
The first task of our EDA was to make some time series plots to see what we where dealing with.

### Total effluent flow
![Total eff flow](https://raw.githubusercontent.com/nathenbyford/MoWaTER/master/plots/All%20filter%20flow.jpeg)

Looking at this plot of the total effluent flow by filter we got a good idea of when each filter was running. We could see when filters 1-3 where being replaced in winter 2020 and that filter 7 was not running almost all year. We also noticed that there is a seasonal pattern and that more water is filtered overall during the summer months compared to the winter months.

### Turbidity
![NTU](https://raw.githubusercontent.com/nathenbyford/MoWaTER/master/plots/NTU.PNG)

This graph added to our origional project our side project. When we showed the Denver Water team this plot they where intrigued by the outliers and tasked us with trying to find the why behind them.

## Statistical Methods
To test weather or not there was an effect from changing the filters we used 2 similar tests:
1. Permutation Test:

    We used a permution test to see if there was a significant difference between the mean NTU before and after filter replacment of filters 1-3, when compared to  the difference in means of all other filters(excluding filter 7). We took data from the same time frame before replacment out of all filters and did the same for   a different time frame after replacment.

2. T-Test
    
    Since the permutation test does not provide us with a P-value or confidence interval we opted run a t-test to obtain both.
    
## Conclusion
If you are intrested in our full findings please go read our tech brief.

We found that there is strong evidence to support that there was a decrease in turbidity in filters 1-3 in a before and after comparison.
