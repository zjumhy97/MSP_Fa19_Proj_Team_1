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
                <img src = "https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1/blob/master/pic/Output_sample.jpg" width = "300" height="200" aligned = centerng>
            </td>
        </tr>
    </table>
</html>

## Log
>>2019/12/15 14:00
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


























