package com.victorhugo.ecommercefitness.controller;

import com.victorhugo.ecommercefitness.dto.AuthenticationDTO;
import com.victorhugo.ecommercefitness.dto.LoginResponseDTO;
import com.victorhugo.ecommercefitness.dto.RegisterClientDTO;
import com.victorhugo.ecommercefitness.infra.security.TokenService;
import com.victorhugo.ecommercefitness.model.Client;
import com.victorhugo.ecommercefitness.model.ClientType;
import com.victorhugo.ecommercefitness.service.ClientService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private ClientService clientService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private TokenService tokenService;

    @GetMapping
    public ResponseEntity<List<Client>> findAll() {
        List<Client> clients = clientService.findAll();
        return ResponseEntity.ok(clients);
    }


    @GetMapping("/{id}")
    public ResponseEntity<Client> findById(@PathVariable Long id) {
        Client client = clientService.findById(id);
        return ResponseEntity.ok().body(client);
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<Client> findByEmail(@PathVariable String email) {
        Client client = clientService.findByEmail(email);
        return ResponseEntity.ok().body(client);
    }


    @PostMapping
    public ResponseEntity<Client> create(@RequestBody Client client) {
        client = clientService.create(client);
        return ResponseEntity.status(HttpStatus.CREATED).body(client);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Client> update(@PathVariable Long id, @RequestBody Client client) {
        client.setPassword(new BCryptPasswordEncoder().encode(client.getPassword()));
        client = clientService.update(id, client);
        return ResponseEntity.ok().body(client);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        clientService.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/auth/login")
    public ResponseEntity login(@RequestBody @Valid AuthenticationDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(),data.password());
        var auth = this.authenticationManager.authenticate((usernamePassword));

        var token = this.tokenService.generateToken((Client) auth.getPrincipal());

        return  ResponseEntity.ok(new LoginResponseDTO(token,data.email()));
    }

    @PostMapping("/auth/register")
    public ResponseEntity register (@RequestBody @Valid RegisterClientDTO data){

        String encryptedPassword = new BCryptPasswordEncoder().encode(data.password());
        Client newClient = new Client(data.name(),data.email(),data.document(),data.phone(),
                encryptedPassword,new ClientType(1L,null, null)
        );

        this.clientService.create(newClient);

        return ResponseEntity.ok().build();
    }
}
