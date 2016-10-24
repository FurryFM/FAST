state("ePSXe")
{
	uint IGT: "ePSXe.exe", 0x74D50C;

}

init
{
	vars.DIGT = 0;
	vars.starttime = 0;

}

startup
{
	
}

start
{

	vars.starttime = current.IGT;
}
 
update
{

	vars.DIGT = current.IGT - vars.starttime;
	
		
		
}



split
{
	
	
}



reset
{


}
 
isLoading
{
	return false;
}
 
gameTime
{	
	return TimeSpan.FromMilliseconds((vars.DIGT)*1000/30);
} 