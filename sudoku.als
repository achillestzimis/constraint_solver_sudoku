//Static-based constrant solver of a Sudoku Game in Alloy.
//Can be run in Alloy4.2 
2013. Author: Achilleas Tzimis. London, UK.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.


sig Grid{ cell: Number -> Number }
sig Number{}
abstract sig Region1, Region2, Region3 extends Number {}
one sig N1, N2, N3 extends Region1 {} 
one sig N4, N5, N6 extends Region2 {} 
one sig N7, N8, N9 extends Region3 {}

pred Init(n: Number){ no cell }

//The predicate states that each row, column and 3x3 column of the grid is complete.
pred invar{ 
	all x, y: Number { lone y.(x.cell) }    
	all row: Number { valid[row, Number] }  
	all col: Number { valid[Number, col] }  
	valid[Region1, Region1]    
	valid[Region1, Region2]
	valid[Region1, Region3]
	valid[Region2, Region1]
	valid[Region2, Region2]
	valid[Region2, Region3]
	valid[Region3, Region1]
	valid[Region3, Region2]
	valid[Region3, Region3] 
}
 
pred valid(rows: set Number, cols: set Number) { 
	Number in cols.(rows.cell)
}

//Fiendish Sudoku taken from Pg 52 The Times newspaper on saturday 08 November 2014. 
pred addPuzzle() {
    
    N1->N6->N9+N1->N7->N8 +
	N2->N5->N1+N2->N7->N6 + N2->N9->N9 +
	N3->N7->N4+N3->N8->N1 + N3->N9->N3 +
	N4->N5->N5+N4->N9->N6 + 
	N5->N2->N1+N5->N4->N4 + N5->N6->N8 + N5->N8->N7 +
	N6->N1->N3+N6->N5->N9 + N6->N7->N1 +
    N7->N1->N2+N7->N2->N7 + N7->N3->N9 +N7->N6->N6+N7->N7->N3+
	N8->N3->N6+N8->N5->N7 + 
	N9->N2->N8+N9->N3->N5 + N9->N4->N9 in cell
}


 