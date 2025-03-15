

#!/bin/bash
# Log file
LOG_FILE="genPhotons.log"
# Pulizia del log precedente
> "$LOG_FILE"
# Definizione dei comandi da eseguire
COMMANDS=(  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_10e -f /lustre/cmsdata/optCalData/pion/pion_1.root -v 1 -e 10 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_10e -f /lustre/cmsdata/optCalData/kaon/kaon_1.root -v 1 -e 10 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_10e -f /lustre/cmsdata/optCalData/proton/proton_1.root -v 1 -e 10 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_200e -f /lustre/cmsdata/optCalData/pion/pion_1.root -v 1 -e 200 -po -r 3" 
 "./genPhotons4 -o ../DataThesis/uniform/po_uni_200e -f /lustre/cmsdata/optCalData/kaon/kaon_1.root -v 1 -e 200 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_200e -f /lustre/cmsdata/optCalData/proton/proton_1.root -v 1 -e 200 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_1000e -f /lustre/cmsdata/optCalData/pion/pion_1.root -v 1 -e 1000 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_1000e -f /lustre/cmsdata/optCalData/kaon/kaon_1.root -v 1 -e 1000 -po -r 3"  
"./genPhotons4 -o ../DataThesis/uniform/po_uni_1000e -f /lustre/cmsdata/optCalData/proton/proton_1.root -v 1 -e 1000 -po -r 3")
# Esegui i comandi uno dopo l'altro
for CMD in "${COMMANDS[@]}"; do  
echo "Eseguendo: $CMD" | tee -a "$LOG_FILE"  
# Esegui il comando e registra il tempo di esecuzione  
{ time $CMD; } &>> "$LOG_FILE"  
if [ $? -eq 0 ]; then    
echo "✔️ Completato: $CMD" | tee -a "$LOG_FILE"  
else    
echo "❌ Errore: $CMD" | tee -a "$LOG_FILE"  
fi  
echo "------------------------------------" | tee -a "$LOG_FILE"
done
echo "Tutte le esecuzioni sono completate!" | tee -a "$LOG_FILE"
