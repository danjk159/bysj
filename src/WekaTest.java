import java.io.File;
import java.io.FileWriter;
import java.util.Random;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.BayesNet;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.classifiers.functions.SMO;
import weka.classifiers.lazy.IB1;
import weka.classifiers.meta.AdaBoostM1;
import weka.classifiers.meta.Bagging;
import weka.classifiers.rules.JRip;
import weka.classifiers.rules.OneR;
import weka.classifiers.rules.PART;
import weka.classifiers.trees.J48;
import weka.classifiers.trees.SimpleCart;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class WekaTest {

	/**
	 * @param args
	 * Liu Juan
	 * @throws Exception 
	 */
	public static void main (String[] args) throws Exception {
		
		DataSource source = new DataSource("/hom/danjk/cpu.arff");
		Instances train = source.getDataSet();
		if(train.classIndex() == -1)
			train.setClassIndex(train.numAttributes() - 1);
			
		FileWriter out = null;
		out = new FileWriter(new File("/hom/danjk/cpu.txt"));
		
		//构建分类器
		NaiveBayes classifier1 = new NaiveBayes();
		BayesNet classifier2 = new BayesNet();
		J48 classifier3 = new J48();
		SimpleCart classifier4 = new SimpleCart();
		JRip classifier5 =new JRip();
		PART classifier6 = new PART();
		OneR classifier7 = new OneR();
		MultilayerPerceptron classifier8 = new MultilayerPerceptron();
		IB1 classifier9 = new IB1();
		SMO classifier10 = new SMO();
		Bagging classifier11 = new Bagging();
		classifier11.setClassifier(classifier1);
		Bagging classifier12 = new Bagging();
		classifier12.setClassifier(classifier3);
		Bagging classifier13 = new Bagging();
		classifier13.setClassifier(classifier6);
		AdaBoostM1 classifier14 = new AdaBoostM1();
		classifier14.setClassifier(classifier1);
		AdaBoostM1 classifier15 = new AdaBoostM1();
		classifier15.setClassifier(classifier3);
		AdaBoostM1 classifier16 = new AdaBoostM1();
		classifier16.setClassifier(classifier6);
		
		Classifier temp[]=new Classifier[]{classifier1,classifier2,classifier3,
										classifier4,classifier5,classifier6,
										classifier7,classifier8,classifier9,
										classifier10,classifier11,classifier12,
										classifier13,classifier14,classifier15,classifier16};
		
		for(int j=0; j<temp.length; j++){			
			long begin = System.currentTimeMillis();//当前时间
			Evaluation eval = new Evaluation(train);//评价数据集
			for(int i=1;i<11;i++){			
				eval.crossValidateModel(temp[j],train,10,new Random(i));//10倍交叉验证				
			}
			long end = System.currentTimeMillis();    //记录结束时间
			long Result = end - begin;
			System.out.println("执行时间："+(end - begin)+"毫秒");
			out.write(eval.toSummaryString("SummaryString",false));
			out.write("运行总时间"+Result);
			out.write("\n-------------------------------------------------------------------------------\n");
			out.flush();
		}						
		
	}		
}
//这是加载一个数据集，分别用16个分类器进行分类，采用的方法是10次10折交叉验证。
