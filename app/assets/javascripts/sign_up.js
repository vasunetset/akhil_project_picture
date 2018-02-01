function validate_username(username)
{
	var char = (username.which) ? username.which : event.keyCode
	if (char > 31 && (char < 48 || char > 57) && (char < 65 || char > 90) 
		&& (char < 97 || char > 122) && ( char != 45 && char != 46 && 
		char != 64 && char != 95))
	{
		alert("Only ' @.-_ ' symbols are allowed.")
		return false;
	}
	
	return true;
}