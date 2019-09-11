package com.briup.web.controller.jfreechart;

import java.awt.Color;
import java.awt.Font;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis3D;
import org.jfree.chart.axis.NumberAxis3D;
import org.jfree.chart.axis.NumberTickUnit;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.CategoryDataset;
import org.jfree.ui.TextAnchor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.briup.service.JfreeService;

/**
 * 报表生成
 */
@Controller
@RequestMapping("/JfreeChart")
public class JfreeChartController {
	@Autowired
	private JfreeService jfreeService;
	private JFreeChart chart;

	@RequestMapping("/Contr")
	// 客户贡献分析
	public String getcstcon(@RequestParam(value="cstname") String cstname,
			HttpServletRequest request, HttpSession session) {
		// 调用service方法查找客户贡献 返回一个数据集
		CategoryDataset dataset;
		try {
			dataset = jfreeService.findCstcontribute(cstname);
		     /*	System.out.println(dataset + "数据集数据集");*/
			                                        // 标题 横坐标 纵坐标 数据集
			chart = ChartFactory.createBarChart3D("客户贡献分析表", "客户", "总金额", dataset, PlotOrientation.VERTICAL, // 图表的方向
					true, // 是否显示图例
					true, // 是否显示工具提示
					true);// 是否产生url链接
			// 处理乱码
			// 处理主题乱码
			chart.getTitle().setFont(new Font("黑体", Font.PLAIN, 18));
			// 处理子标题乱码
			chart.getLegend().setItemFont(new Font("黑体", Font.PLAIN, 18));

			// 获取图形的绘制机构
			CategoryPlot categoryPlot = (CategoryPlot) chart.getPlot();

			// 设置网格背景颜色
			categoryPlot.setBackgroundPaint(Color.white);
			// 设置网格竖线颜色
			categoryPlot.setDomainGridlinePaint(Color.pink);
			// 设置网格横线颜色
			categoryPlot.setRangeGridlinePaint(Color.pink);
			// 获取x轴
			CategoryAxis3D categoryAxis3D = (CategoryAxis3D) categoryPlot.getDomainAxis();
			// 获取y轴
			NumberAxis3D numberAxis3D = (NumberAxis3D) categoryPlot.getRangeAxis();

			// 处理x轴外乱码
			categoryAxis3D.setLabelFont(new Font("黑体", Font.PLAIN, 11));
			// 处理x轴上乱码
			categoryAxis3D.setTickLabelFont(new Font("黑体", Font.PLAIN, 11));

			// 处理y轴外上乱码
			numberAxis3D.setLabelFont(new Font("黑体", Font.PLAIN, 12));
			numberAxis3D.setTickLabelFont(new Font("黑体", Font.PLAIN, 12));

			// 设置y轴的刻度
			numberAxis3D.setAutoTickUnitSelection(true);
			NumberTickUnit unit = new NumberTickUnit(40);
			numberAxis3D.setTickUnit(unit);

			//显示柱的数值，并修改该数值的字体属性 
			BarRenderer3D barRenderer3D = (BarRenderer3D) categoryPlot.getRenderer();
			barRenderer3D.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
			barRenderer3D.setBaseItemLabelsVisible(true);

			barRenderer3D.setBasePositiveItemLabelPosition(
					new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));

			barRenderer3D.setBaseItemLabelFont(new Font("黑体", Font.PLAIN, 15));
			barRenderer3D.setMaximumBarWidth(0.05);
			
			// 保存图片 返回图片文件名
			String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
			// 获取图片路径（内存中） 需要在web.xml中配置一下
			String chartURL=request.getContextPath() + "/chart?filename="+fileName;  
			session.setAttribute("chartURL", chartURL);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/~rept/contr";
	}
	
	
	
	   //客户构成分析
	    @RequestMapping("/Cons")
		public String makeup(@RequestParam(value="condit") int condit,HttpServletRequest request,HttpSession session) {
			CategoryDataset dataset;
			try {
				dataset = jfreeService.findCstMakeup(condit);
				String title = "";
				if (condit == 0) {
					title = "客户级别百分比分析表";
				} else if (condit == 1) {
					title = "客户信誉度分析表";
				} else if (condit == 2) {
					title = "客户满意度分析表";
				}
				chart = ChartFactory.createBarChart3D(title, "客户类型", "百分比", dataset, PlotOrientation.VERTICAL, // 图表的方向
						true, // 是否显示图例
						true, // 是否显示工具提示
						false);// 是否产生url链接
				
				// 处理乱码
				// 处理主题乱码
				chart.getTitle().setFont(new Font("黑体", Font.PLAIN, 18));
				// 处理子标题乱码
				chart.getLegend().setItemFont(new Font("黑体", Font.PLAIN, 18));
				
				// 获取图形的绘制机构
				CategoryPlot categoryPlot = (CategoryPlot) chart.getPlot();
				
				// 设置网格背景颜色
				categoryPlot.setBackgroundPaint(Color.white);
				// 设置网格竖线颜色
				categoryPlot.setDomainGridlinePaint(Color.pink);
				// 设置网格横线颜色
				categoryPlot.setRangeGridlinePaint(Color.pink);
				// 获取x轴
				CategoryAxis3D categoryAxis3D = (CategoryAxis3D) categoryPlot.getDomainAxis();
				// 获取y轴
				NumberAxis3D numberAxis3D = (NumberAxis3D) categoryPlot.getRangeAxis();
				
				// 处理x轴外乱码
				categoryAxis3D.setLabelFont(new Font("黑体", Font.PLAIN, 11));
				// 处理x轴上乱码
				categoryAxis3D.setTickLabelFont(new Font("黑体", Font.PLAIN, 11));
				
				// 处理y轴外、上乱码
				numberAxis3D.setLabelFont(new Font("黑体", Font.PLAIN, 12));
				numberAxis3D.setTickLabelFont(new Font("黑体", Font.PLAIN, 12));
				
				// 设置y轴的刻度
				numberAxis3D.setAutoTickUnitSelection(true);
				NumberTickUnit unit = new NumberTickUnit(0.25);
				numberAxis3D.setTickUnit(unit);
				
				BarRenderer3D barRenderer3D = (BarRenderer3D) categoryPlot.getRenderer();
				barRenderer3D.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
				barRenderer3D.setBaseItemLabelsVisible(true);
				
				barRenderer3D.setBasePositiveItemLabelPosition(
						new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
				
				barRenderer3D.setBaseItemLabelFont(new Font("黑体", Font.PLAIN, 15));
				barRenderer3D.setMaximumBarWidth(0.05);
				
				// 保存图片 返回图片文件名
				String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400, null, request.getSession());
				// 获取图片路径（内存中） 在web.xml中配置一下chart
				String chartURL=request.getContextPath() + "/chart?filename="+fileName;  
				session.setAttribute("chartURL", chartURL);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "pages/~rept/cons";
		  }
	
	
}
