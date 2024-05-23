import pandas as pd

def clean_data():
    data = pd.read_csv('functions.simp.csv')
    data_clean = pd.DataFrame(columns=['function_id','gene_id'])
    for i in range(len(data)):
        row = data.iloc[i]
        genes = row['geneID'].split('/')
        for gene in genes:
            data_clean = data_clean._append({'function_id':row['function_id'],'gene_id':gene}, ignore_index=True)
    data_clean.to_csv('functions.simp.clean.csv', index=False)

clean_data()