




















































import Proving.USC.T18.Ch11.Elements.Statute
import Proving.USC.T18.Ch11.Deontic.Statute
import Proving.USC.T18.Ch11.Ontology.Statute
import Proving.USC.T18.Ch11.Procedure.Statute

namespace Proving.USC.Reconciled.T18Ch11

open Proving.USC.T18.Ch11
open Proving.USC.Common





abbrev Bribery201 := @Elements.ViolatesSection201


abbrev SpecialGovtEmployee202 := @Ontology.SpecialGovtEmployeeMembership
abbrev SpecialGovtEmployee202Days := @Procedure.IsSpecialGovernmentEmployee

abbrev Compensation203 := @Elements.Section203a_Receiver

abbrev Practice204 := @Elements.Section204

abbrev Agent205 := @Elements.Section205a1_Claim

abbrev Exemption206 := @Deontic.Permission206

abbrev PostEmployment207 := @Elements.ViolatesSection207

abbrev FinancialInterest208 := @Elements.Section208a

abbrev SalarySupplement209 := @Elements.Section209a_Receiver

abbrev AppointiveGive210 := @Elements.Section210

abbrev AppointiveSolicit211 := @Elements.Section211

abbrev ExaminerLoan212 := @Elements.Section212

abbrev ExaminerAccept213 := @Elements.Section213

abbrev FederalReserveFee214 := @Elements.Section214

abbrev BankBribery215 := @Elements.Section215a1_Giver

abbrev CivilEnforcement216 := @Elements.Section216b_CivilAction

abbrev FarmIndebtedness217 := @Elements.Section217

abbrev Recovery218 := @Elements.Section218_Recovery

abbrev ForeignAgent219 := @Elements.Section219

abbrev EKRA220 := @Elements.Section220a1_Solicit

abbrev SportsBribery224 := @Elements.Section224

abbrev CFCE225 := @Elements.Section225

abbrev PortSecurity226 := @Elements.Section226a1_Giver

abbrev PrivateEmployment227 := @Elements.Section227







inductive Ch11PredicateOffense (p o : Person) (t : Elements.Thing)
    (m : Elements.Matter) (e : Elements.Entity) (c : ComplaintText) : Prop where
  | s201 (h : Elements.ViolatesSection201 p o t m c) : Ch11PredicateOffense p o t m e c
  | s224 (h : Elements.Section224 p e c)             : Ch11PredicateOffense p o t m e c

end Proving.USC.Reconciled.T18Ch11
