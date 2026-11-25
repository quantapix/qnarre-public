import Proving.USC.T18.Ch1.Procedure.Predicates








namespace Proving.USC.T18.Ch1.Procedure

open Proving.USC.Common










structure TimelyDisclosure (p : Person) (c : ComplaintText) : Prop where
  knowledge : HadKnowledgeOfFelony p c
  disclosed : DisclosureMade p c
  timely    : DisclosureTimely p c




structure MisprisionBreach (p : Person) (c : ComplaintText) : Prop where
  knowledge    : HadKnowledgeOfFelony p c
  concealed    : ConcealedFelony p c
  notDisclosed : ¬ DisclosureMade p c





def WithinFederalTerritorialJurisdiction (loc : Location) (c : ComplaintText) : Prop :=
  WithinSMTJ loc c







structure AssimilatedOffense (p : Person) (loc : Location) (c : ComplaintText) : Prop where
  onFederalPlace   : WithinSection7Place loc c
  noFederalOffense : NotPunishableByFederalEnactment p c
  stateOffense     : PunishableUnderStateLaw p c

end Proving.USC.T18.Ch1.Procedure
