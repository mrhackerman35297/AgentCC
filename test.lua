local Admins = {
	Superheros = {},
  AbusePerms = {},
  Premium = {},
}

function Whitelist(Direction, id)
  table.insert(Direction, id)
end

Whitelist(Admins.Superheros, 2477315635)

return Admins
