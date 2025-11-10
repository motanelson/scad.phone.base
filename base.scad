// SUPORTE DE TELEMÓVEL OPENSCAD
// Parâmetros personalizáveis

largura_tele = 75;       // Largura do telemóvel (mm)
altura_tele = 150;       // Altura do telemóvel (mm)
espessura_tele = 10;     // Espessura máxima do telemóvel (mm)
angulo_inclinacao = 60;  // Ângulo de inclinação (graus)

// Base do suporte
module base() {
    color("Yellow")
    // Base principal
    cube([largura_tele + 20, 10, 50]);
    
    // Suporte traseiro
    translate([0, 10, 0])
    rotate([angulo_inclinacao, 0, 0])
    cube([largura_tele + 20, 5, altura_tele/2]);
}

// Canal para telemóvel
module canal_tele() {
    color("Yellow")
    difference() {
        // Bloco principal
        cube([largura_tele + 10, 15, 60]);
        
        // Canal do telemóvel
        translate([5, 5, 5])
        cube([largura_tele, 15, 55]);
        
        // Inclinação do canal
        translate([-1, 10, 0])
        rotate([angulo_inclinacao, 0, 0])
        cube([largura_tele + 12, 20, 80]);
    }
}

// Suporte inferior
module suporte_inferior() {
    color("Yellow")
    difference() {
        // Base do suporte
        cube([largura_tele + 10, 20, 10]);
        
        // Ranhura para telemóvel
        translate([5, 10, -1])
        cube([largura_tele, 15, 12]);
    }
}
color("Yellow")
// COMPOSIÇÃO FINAL
union() {
    // Base
    base();
    
    // Canal do telemóvel
    translate([5, 0, 0])
    canal_tele();
    
    // Suporte inferior
    translate([5, -20, 0])
    suporte_inferior();
    
    // Reforços laterais
    for(x = [0, largura_tele + 15]) {
        translate([x, 0, 0])
        cube([5, 30, 50]);
    }
}

