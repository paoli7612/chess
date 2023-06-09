Pawn = require('pieces/pawn')
Tower = require('pieces/tower')
Horse = require('pieces/horse')
Bishop = require('pieces/bishop')
Queen = require('pieces/queen')
King = require('pieces/king')

function pawns(boss, team, y, t)
    for x=0, 7 do
        table.insert(team.pieces, Pawn(boss, x, y, t))
    end
end

function Team(boss, t)
    local team = {}
    if t then 
        team.pieces = {
            Tower(boss, 0, 0, t),
            Horse(boss, 1, 0, t),
            Bishop(boss, 2, 0, t),
            Queen(boss, 3, 0, t),
            King(boss, 4, 0, t),
            Bishop(boss, 5, 0, t),
            Horse(boss, 6, 0, t),
            Tower(boss, 7, 0, t)
        }
        pawns(boss, team, 1, t)
    else
        team.pieces = {
            Tower(boss, 0, 7, t),
            Horse(boss, 1, 7, t),
            Bishop(boss, 2, 7, t),
            Queen(boss, 3, 7, t),
            King(boss, 4, 7, t),
            Bishop(boss, 5, 7, t),
            Horse(boss, 6, 7, t),
            Tower(boss, 7, 7, t)
        }
        pawns(boss, team, 6, t)
    end

    function team.draw()
        for k,v in pairs(team.pieces) do
            v.draw()
        end	
    end

    function team.getPiece(x, y)
        for k, v in pairs(team.pieces) do
            if v.x == x and v.y == y then
                return v
            end
        end
    end
    
    return team
end

return Team