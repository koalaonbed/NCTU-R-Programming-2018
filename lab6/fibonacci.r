data.file = "hw6_input.csv"
ans.file = "hw6_answer.csv"
data<-read.csv(data.file, header=FALSE, sep=",")
ans <- read.csv(ans.file, header=FALSE, sep=",")
len<-30
f<-numeric(len)
for(n in data){
	
	if(n<3){f[n]=1}
	else{f[n]=f[n-1]+f[n-2]}
	my_ans = f[n]
	if(my_ans!=ans[n]){print(c("error", n, my_ans, ans[n]))}
}