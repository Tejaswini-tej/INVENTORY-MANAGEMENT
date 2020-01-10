package trg.talentsprint.starterkit.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Invoice;

@Repository
public interface InvoiceRepository extends CrudRepository<Invoice, Long> {

}
