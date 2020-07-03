extension WizardsTableViewController {
    
     func prepareInformationsForSegue(_ vc: WizardDetailsController, _ character: Characters?){
           vc.wizardName = (character!.name)
           vc.role = (character?.role ?? "Unknow information")
           vc.fear = (character?.boggart ?? "Unknow information")
           vc.wand = (character?.wand ?? "Unknow information")
           vc.house = (character?.house?.rawValue ?? "Unknow information")
           vc.animagus = (character?.animagus ?? "Unknow information")
           vc.patronus = (character?.patronus ?? "Unknow information")
           vc.bloodStatus = (character?.bloodStatus.rawValue ?? "Unknow information")
           vc.school = (character?.school?.rawValue ?? "Unknow information")
           vc.ministryMagic = character?.ministryOfMagic
           vc.orderPhoenix = character?.orderOfThePhoenix
           vc.deathEate = character?.deathEater
           vc.dumbledoreArmy = character?.dumbledoresArmy
       }

}
