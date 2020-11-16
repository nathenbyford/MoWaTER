# MoWaTER 2020 Denver Water Project
![Denver Water logo](https://www.denverwater.org/sites/default/files/DW-Horizontal.png)

***Disclaimer:*** The data for this project is property of [Denver Water](https://www.denverwater.org/) and is not saved on this repository. The data was provided for the [MoWaTER](https://www.baylor.edu/mowater/) Summer program 2020. The Denver Water team consisted of Nathen Byford(Baylor University), Jacqueline Alexandra Evans(Baylor University), and Xi Le(Colorado School of Mines). 

*This README is a summary of our tech brief if you would like more details about our findings please look at our [tech brief file](https://github.com/nathenbyford/MoWaTER/blob/master/Summer2020_DW_TechBrief.pdf)!*

## Preamble
This project took a look at the data involved in water filtration at the *Denver Water* foothills filtration plant. Our project focused on looking at the water quality measuments for each of the filters at the plant. Three of the filters had been changed in winter 2019. We wanted to look and see if replacing the filter made a significant difference in the quality of water and effectiveness of the filter.

### Data
The data given to us by Denver Water is constructed of the data and time, turbidity,  head loss, total effluent flow, and filter runtime of each observation.
Data was recorded in 5 minute intervals for each filter. Turbidity is measured in Nephelometric Turbidity Units(NTU), which is a measure of water clarity. So the clearer the water, the lower the turbidity. Head loss is measured by the amount of energy lost in the filtration process. Total effluent flow is the total amount of water flowing through each filter. Filter runtime is the length of time the filter has been running since its last cleaning cycle.

## Exploratory Data Analysis
The first task of our EDA was to make some time series plots to see what we where dealing with.

### Total effluent flow
![Total eff flow](https://raw.githubusercontent.com/nathenbyford/MoWaTER/master/plots/All%20filter%20flow.jpeg)

Looking at this plot of the total effluent flow by filter we got a good idea of when each filter was running. We could see when filters 1-3 were being replaced in winter 2020 and that filter 7 was not running almost all year. We also noticed there is a seasonal pattern and that more water is filtered overall during the summer months compared to the winter months.

### Turbidity
![NTU](https://raw.githubusercontent.com/nathenbyford/MoWaTER/master/plots/NTU.PNG)

This graph gave us an unintentional side project. When we showed the Denver Water team this plot they where intrigued by the outliers, and tasked us with trying to find the cause.

## Statistical Methods
To test whether or not there was a difference in water clarity before and after the filters were replaced we used 2 similar tests:
1. Permutation Test:

    We used a permutation test to test if there was a significant difference between the mean NTU before and after filter replacement of filters 1-3. When compared to  the difference in means of all other filters(excluding filter 7). We took data from before replacement and after replacement, excluding the time that filters 1-3 were down.

2. T-Test:
    
    Since the permutation test does not provide us with a P-value or confidence interval. So, we opted run a t-test to obtain both.
    
## Conclusion
If you are intrested in our full findings please go read our tech brief.

We found that there is strong evidence to support that there was a decrease in turbidity in filters 1-3 in a before and after comparison.
