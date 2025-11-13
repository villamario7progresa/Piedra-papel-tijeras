//
//  ViewController.swift
//  Piedra papel tijeras
//
//  Created by alumno3 on 6/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblMac: UILabel!
    @IBOutlet weak var imgMac: UIImageView!
    
    var victoriasusuario : Int!
    var victoriasmac : Int!
    var listaImagenes : [UIImage]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         victoriasusuario = 0
         victoriasmac = 0
        
        listaImagenes = [UIImage(named: "piedra")!,UIImage(named: "papel")!, UIImage(named: "tijeras")!]
        
    }
    
    @IBAction func btnPiedra(_ sender: Any) {
        let tiradaMac = generarTirada()
        comprobarGanador(usuario: 0, mac: tiradaMac)
    }
    
    @IBAction func btnPapel(_ sender: Any) {
        let tiradaMac = generarTirada()
        comprobarGanador(usuario: 1, mac: tiradaMac)
    }
    
    @IBAction func btnTijeras(_ sender: Any) {
        let tiradaMac = generarTirada()
        comprobarGanador(usuario: 2, mac: tiradaMac)
    }
    
    func generarTirada() -> Int {
        let aleatorio = Int.random(in: 0...2)
        imgMac.image = listaImagenes[aleatorio]
        return aleatorio
    }
    func comprobarGanador(usuario: Int, mac: Int){
        switch usuario {
                case 0:
                    switch mac {
                    case 1:
                        victoriasmac += 1
                    case 2:
                        victoriasusuario += 1
                    default:
                        break
                    }
                    
                case 1:
                    switch mac {
                    case 0:
                        victoriasusuario += 1
                    case 2:
                        victoriasmac += 1
                    default:
                        break
                    }
                    
                case 2:
                    switch mac {
                    case 0:
                        victoriasmac += 1
                    case 1:
                        victoriasusuario += 1
                    default:
                        break
                    }
                    
                default:
                    break
                }
        
        lblUsuario.text = "\(victoriasusuario!)"
        lblMac.text = "\(victoriasmac!)"
    }
}

