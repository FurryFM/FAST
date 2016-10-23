state("ePSXe")
{
	uint IGT: "ePSXe.exe", 0x74D50C;
	uint Items: "ePSXe.exe", 0x749E0C;
	uint HP: "ePSXe.exe", 0x740BFE;
	uint Ammo: "ePSXe.exe", 0x7410E2;
	uint Reset: "ePSXe.exe", 0x740B94;
	uint BossHP: "ePSXe.exe", 0x74EFDC;
	uint Guy: "ePSXe.exe", 0x7243E4;
	uint Fader: "ePSXe.exe", 0x724458;
	uint Dogkick: "ePSXe.exe", 0x738B24;
	uint Kick: "ePSXe.exe", 0x74B518;
	uint FIGT: "ePSXe.exe", 0x74D514;
	uint Zenny: "ePSXe.exe", 0x74D51C;
	byte PoliceHP: "ePSXe.exe", 0x7E81CE;
	byte BankHP: "ePSXe.exe", 0x7E84DA;
	//uint LARM: "ePSXe.exe", 0x74F324;
	//uint RARM: "ePSXe.exe", 0x74F310;
	//uint LCAN: "ePSXe.exe", 0x74F37C;
	//uint RCAN: "ePSXe.exe", 0x74F368;
}

init
{
	vars.lastSplit = 0;
	vars.display = 1;
	vars.splittime = 0;

}

startup
{
	
}

start
{
	
	vars.lastSplit = 0;
	return current.IGT < old.IGT && current.IGT < 100 && current.Reset != 0;
	vars.TopLine = "";
	vars.BottomLine = "";
}
 
update
{

	vars.delay = current.IGT - vars.splittime;
	
		
		if (vars.lastSplit == 2) 
		{
			vars.TopLine = "Route Help:";
			vars.BottomLine = "JMC, go to sewer!";
		}
		if (vars.lastSplit == 3) 
		{
			vars.TopLine = "";
			vars.BottomLine = "";
		}
		if (vars.lastSplit == 4) 
		{
			vars.TopLine = "Police HP: " + current.PoliceHP + "/75";
			vars.BottomLine = "Bank HP: " + current.BankHP + "/75";
		}
		if (vars.lastSplit == 5) 
		{
			vars.TopLine = "";
			vars.BottomLine = "";
		}
		if (vars.lastSplit == 6) 
		{
			vars.Glory = current.Zenny + 928;
			vars.TopLine = "Zenny: " + current.Zenny + "0z";
			vars.BottomLine = "w/ Glory Hole: " + vars.Glory + "0z";
		}
		if (vars.lastSplit == 7) 
		{
			vars.TopLine = "Top for Top Left";
			vars.BottomLine = "Bot for Bot Left";
		}
		if (vars.lastSplit == 8) 
		{
			vars.TopLine = "Dorito King Menu:";
			vars.BottomLine = "Bot for Top Right";
		}
		if (vars.lastSplit == 9) 
		{
			vars.TopLine = "Mid for Mid Left";
			vars.BottomLine = "Bot for Top Right";
		}
		if (vars.lastSplit == 10) 
		{
			vars.TopLine = "Fokkerwolf Menu:";
			vars.BottomLine = "Bot for Mid Left";
		}
		if (vars.lastSplit == 11) 
		{
			vars.TopLine = "Mid for Top Right";
			vars.BottomLine = "Bot for Mid Right";
		}
		if (vars.lastSplit == 12) 
		{
			vars.TopLine = "";
			vars.BottomLine = "";
		}


		//vars.LAShots = 19 - ((67109888 - current.LARM)/56);
		//vars.RAShots = 19 - ((67109888 - current.RARM)/56);
		//vars.LCShots = 11 - ((37749312 - current.LCAN)/56);
		//vars.RCShots = 11 - ((37749312 - current.RCAN)/56);
		//vars.TopLine = "R. Arm: " + vars.RAShots + "   L. Arm: " + vars.LAShots;
		//vars.BottomLine = "R. Can: " + vars.RCShots + "   L. Can: " + vars.LCShots;

}



split
{
	
	if(current.BossHP < old.BossHP && current.BossHP == 0 && vars.lastSplit == 0) 
    {
        vars.lastSplit = 1;
        return true;
    }
    if (current.Dogkick == 6553727 && current.Kick != 1 && current.Guy == 1 && vars.lastSplit == 1) {
        vars.lastSplit = 2;
        return true;
    }
    if (current.Items == 9217 && vars.lastSplit == 2) {
        vars.lastSplit = 3;
        vars.splittime = current.IGT;
        return true;
    }
    if (current.Guy == 5 && vars.delay > 100 && vars.lastSplit == 3) {
        vars.lastSplit = 4;
        vars.splittime = current.IGT;
        return true;
    }
    if (current.Guy == 2 && vars.delay > 100 && vars.lastSplit == 4) {
        vars.lastSplit = 5;
        vars.splittime = current.IGT;
        return true;
    }
    if (current.Guy == 3 && vars.delay > 1000 && vars.lastSplit == 5) {
        vars.lastSplit = 6;
        return true;
    }
    
	
	if(current.Items ==  75546369 && current.Fader == 1 && vars.lastSplit == 6) 
	{
		vars.lastSplit = 7;
		vars.splittime = current.IGT;
		return true;
	}
	if (current.BossHP == 0 && current.BossHP < old.BossHP && vars.delay > 8000 && vars.lastSplit == 7) {
		vars.lastSplit = 8;
		return true;
	}
	if (current.Guy == 255 && current.Fader == 1 && vars.lastSplit == 8) {
		vars.lastSplit = 9;
		return true;
	}
	if(current.Items == 83820387 && current.Guy == 1 && current.Fader == 1 && vars.lastSplit == 9) 
   	 {
        	vars.lastSplit = 10;
		vars.splittime = current.IGT;
        	return true;
    	}
	if(current.BossHP < old.BossHP && current.BossHP == 0 && current.Guy == 3 && vars.lastSplit == 10) 
    	{
   	    	vars.lastSplit = 11;
		vars.splittime = current.IGT;
        	return true;
    	}
	if(current.Guy == 4 && vars.delay > 2000 && vars.lastSplit == 11) 
    	{
        	vars.lastSplit = 12;
        	return true;
    	}
	if(current.Items == 1157562211 && vars.lastSplit == 12) 
    	{
        	vars.lastSplit = 13;
        	return true;
    	}
	if(current.Items == 3305045859 && vars.lastSplit == 13) 
  	{
     	   	vars.lastSplit = 14;
        	return true;
    	}
	if(current.Items == 3305111395 && vars.lastSplit == 14) 
  	  {
        	vars.lastSplit = 15;
        	return true;
    	}
	if(current.Guy == 0 && current.BossHP == 0 && vars.lastSplit == 15) 
   	{
        	vars.lastSplit = 16;
		vars.splittime = current.IGT;
        	return true;
    	}
	if(current.BossHP == 0 && current.Guy == 2 && vars.lastSplit == 16) 
    	{
        	vars.lastSplit = 17;
        	return true;
    	}
	if (current.FIGT != 0 && current.FIGT < current.IGT && vars.lastSplit == 17) {
		vars.lastSplit = 18;
		return true;
	}
	return false;
}



reset
{
	return current.Reset == 0 && current.HP == 0 && current.IGT == old.IGT && current.Ammo == 0;

}
 
isLoading
{
	return false;
}
 
gameTime
{	
	return TimeSpan.FromMilliseconds((current.IGT)*1000/30);
} 