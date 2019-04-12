public class StringArrayTest {

    public static List<String> generateStringArray(Integer n) {
        List<String> miLista = new List<String>();
        for (Integer i=0; i<n; i++) {
            miLista.add('Test ' + i);
            system.debug(miLista[i]);
        }  
        return miLista;
    
	}
}