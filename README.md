# Modern Siganl Processing (2019Fall) Project Team 1

## Requirements
1. Need to use the <b>[EM algorithm](https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm)</b>
2. Need to employ the <b>[Gaussian Mixture Modeling](https://brilliant.org/wiki/gaussian-mixture-model/)</b>
3. Can <b>combine with other image processing techniques</b> to improve the final result
4. Need to submit source code, PPT presentation, and a project report in word
5. Scoring criteria: segmentation result; coding (efficiency + beauty); presentation; report
6. Due Time: Decemeber 26,2019(Thrusday),10:20-12:10
7. Presentation time: 12 mins perteam 

## Project: Eye image Segmentation (color image)

<html>
    <table style="margin-left: auto; margin-right: auto;">
        <tr>
            <td>
                <!--left column-->
                Input example:
                <img src = "https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1/blob/master/pic/Input_sample.jpg" width = "300" height="200" aligned = centering>
            </td>
            <td>
                <!--rightcolumn-->
                Output example:
                <img src = "https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1/blob/master/pic/Output_sample.jpg" width = "300" height="200" aligned = centering>
            </td>
        </tr>
    </table>
</html>

## I. INTRODUCTION
The segmentation algorithm used in this project is based on a parametric model in which the probability density function (PDF) is a mixture of $K$ Gaussian density functions. $K$ is the total number of the Gaussian components. As a model-based segmentation algorithm, its performance is influenced by the shape of the image histogram and the accuracy of the estimates of the model parameters[[1]](#1).

<img src="https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1/blob/master/pic/Image_and_Histogram.jpg" width="600" height = "400" aligned = centering>
<center>Input image and the Histogram</center>


## II. THE METHOD

### A. Gaussian Mixture Model

### B. Expectation-Maximize Algorithm



## III. EXPERIMENT




## IV. CONCLUSION



## 4. Conclusion

## References
<a id="1">[1]</a> 
Gupta, Lalit, and Thotsapon Sortrakul. 
"A Gaussian-mixture-based image segmentation algorithm." Pattern Recognition 31, no. 3 (1998): 315-325.








## Log
<details>
<summary>2019/12/15 14:00 -- by Haoyu</summary>
1. main.m  \
<b>目前进度</b>\
导入图像数据，以及转化为HSV\
<b>仍需完成</b>\
待算法完成后对图像进行测试

1. Expectatiton_Maximization_GMM.m \
<b>目前进度</b>\
程序已经写完，但还没有测试\
<b>可能的测试方法</b>\
三硬币模型\
<b>可能存在的问题</b>\
该程序没有采用已有函数，如mvnpdf等，细节全部为手动实现，可能存在纰漏，且运行速度表现可能比自带函数要差

2. GMM_based_segmentation.m \
<b>目前进度</b>\
实现图像数据转化为序列，分割的判定条件尚未补充\
<b>仍需完成</b>\
实现图像分割判断条件，将处理后得到的序列恢复为图像的数据格式\
<b>可能存在的问题</b>\
图像数据转化为序列采用的squeeze自带函数运行速度较慢，影响程序速度
</details>

<details>
<summary>2019/12/16 20:30 -- by Haoyu</summary>

<b>目前的问题</b>
1. 第一版的代码完成了，但是我发现自己犯了非常致命的错误，从底层实现EM算法时，我全部采用了手动实现，采用了大量的for循环，对于EM算法来说，在E-step时要计算Q函数的值，每次都要对N个数据样本进行求和，而每次求和都要计算一个非常复杂的表达式。但最关键的问题在于样本图像是1728*2592的，对于N来说规模非常大。算法的运算速度是不可接受的。
2. 在计算Q函数时，其中有采用log函数，而在这里出现的致命问题是，log函数的自变量的值出现负数的情况，从而导致算法出现错误。

<b>下一步计划</b>
1. 重构EM算法，牺牲算法的通用性换取EM-GMM实现图像分割的性能。
2. 完善程序核心算法的外围结构，为下一个版本的算法测试做好准备。

<b>核心关注点</b>
1. 优化算法
</details>

<details>
<summary>2019/12/17 15:00-- by Haoyu</summary>

1. Zhenwei 目前实现了一个版本的EM-GMM，他目前正在完成代码注释，完成后将合并到项目中来。
2. 补充了原图像的直方图，说明为什么要采用GMM的方法去进行图像分割。
</details>
























