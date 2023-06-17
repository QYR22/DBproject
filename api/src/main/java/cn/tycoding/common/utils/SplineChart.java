package cn.tycoding.common.utils;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/* HighChart.js Spline图表数据封装 */
@Data
@Accessors(chain = true)
public class SplineChart implements Serializable {

    private String time;

    private Long num;
}
