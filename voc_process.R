require(ggplot2)
require(dplyr)

voc_process <- function(voc_data,axis_limit=5){
  #axis_limit is the limit of the geom_col length to be plotted. Data above the limit will be denoted with a bar of this length accompanied by a label of the actual data value.
  
  voc_data<-mutate(voc_data,text=ifelse(`Detected concentration`>axis_limit,`Detected concentration`,NA),Trace=ifelse(Trace==1,"T",NA))
  voc_data$Compound <- factor(voc_data$Compound, levels = rev(c("o-Cresol", "2-Methoxyphenol","m.p-Cresol","Creosol","4-Ethyl-2-methoxyphenol","Acenaphthylene","Acrolein","Acetronitrile","2-Furaldehyde","Salicylaldehyde","2,4-Dimethylphenol","Naphthalene","2-Methylnaphthalene","Biphenyl","Methylbiphenyl")))
  
  for (i in unique(voc_data$Location)){
    location_plot <- ggplot(filter(voc_data,Location==i), aes(x=Compound,y=`Detected concentration`,fill=Indicator,alpha=`Below limit`))+
      geom_col()+
      scale_alpha(range=c(1,0.3))+
      geom_point(aes(y=`Report limit`),shape="|",fill="black",alpha=0.8,size=5)+
      geom_text(aes(label=text),y=axis_limit)+
      geom_text(aes(y=`Detected concentration`-(axis_limit/50),label=Trace),alpha=1)+
      scale_fill_manual(values=c("Red","Orange"))+
      guides(alpha="none",fill="none")+
      ylab("Detected Concentration: μg/m3")+
      coord_flip(ylim=c(0,axis_limit))+
      theme_minimal()
    
    print(location_plot)
  }
  
}
