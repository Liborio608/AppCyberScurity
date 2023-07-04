import React, { useState } from 'react';
import { View, Text, TextInput, StyleSheet, ImageBackground, Image, Alert, TouchableOpacity } from 'react-native';
import { NavigationContainer, useNavigation } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { Linking } from 'react-native';


const Stack = createStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="Menu" component={Menu} />
        <Stack.Screen name="Leitura" component={Leitura} />
        <Stack.Screen name="Cadastro" component={Cadastro} />
        <Stack.Screen name="ModoInfantil" component={ModoInfantil} />
        <Stack.Screen name="ajuda" component={ajuda}/>
        <Stack.Screen name="ferramentas" component={ferramentas}/>
      </Stack.Navigator>
    </NavigationContainer>
  );
};

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigation = useNavigation();

  const handleLogin = () => {
    if (username === 'User@gmail.com' && password === 'admin') {
      Alert.alert('Login efetuado com sucesso');
      navigation.navigate('Menu');
    } else {
      Alert.alert('Erro', 'E-mail ou senha inválida!');
    }
  };

   const handleRegister = () => {
    navigation.navigate('Cadastro');
  };

  const handleNavigateTogoogle = () => {
    const videoURL = 'https://accounts.google.com/signup/v2/webcreateaccount?biz=false&cc=BR&continue=https%3A%2F%2Fmail.google.com&dsh=S-284732814%3A1686001236130203&flowEntry=SignUp&flowName=GlifWebSignIn&hl=en&service=mail&authuser=0';
    Linking.openURL(videoURL)
      .catch(() => {
        console.log('Falha ao tentar carregar o vídeo');
      });
  };

  return (
    <ImageBackground
      source={{ uri: 'https://i.ibb.co/q1nCD2s/image.png' }}
      style={styles.backgroundImage}
    >
      <View style={styles.container}>
        <Image
          source={{ uri: 'https://i.ibb.co/syCmR0D/Cyber-Security-265x300.png' }}
          style={styles.logo}
        />
        <Text style={styles.boldText}>Login</Text>

        <View style={styles.inputContainer}>
          <TextInput
            style={styles.input}
            placeholder="E-mail"
            placeholderTextColor="#ADADAD"
            value={username}
            onChangeText={setUsername}
          />
          <TextInput
            style={styles.input}
            placeholder="Senha"
            placeholderTextColor="#ADADAD"
            secureTextEntry
            value={password}
            onChangeText={setPassword}
          />
        
        <Text style={styles.senha}>Esqueci a senha ou e-mail</Text>
        </View>

        <TouchableOpacity style={styles.button} onPress={handleLogin}>
          <Text style={styles.buttonText}>Entrar</Text>
        </TouchableOpacity>

        <View style={styles.bottomContainer}>
          <View style={styles.registrarContainer}>
            <Text style={styles.registrar}>Não tem uma conta?</Text>
            <TouchableOpacity onPress={handleRegister}>
            <Text style={styles.registrarblue}>Registre-se</Text>
            </TouchableOpacity>
          </View>
          
        </View>
        <TouchableOpacity onPress={handleNavigateTogoogle}>
        <Image
          source={require('./png/Sign_in_with_Google_Button-removebg-preview.png')}
          style={styles.image}
        />
        </TouchableOpacity>
        <Image source={require('./png/image.png')} style={styles.image2} />
      </View>

    </ImageBackground>
  );
};


const Menu = () => {

  const handleNavigateModoInfantil = () => {
    navigation.navigate('ModoInfantil');
  };

  const navigation = useNavigation();

  const handleNavigateLeitura = () => {
    navigation.navigate('Leitura');
  };

  return (
    <ImageBackground
      source={{ uri: 'https://i.ibb.co/q1nCD2s/image.png' }}
      style={styles.backgroundImage}
    >

      <Image
        source={{ uri: 'https://i.ibb.co/syCmR0D/Cyber-Security-265x300.png' }}
        style={styles.logo2}
      />
      
      <Text style={styles.bemvindo}>Bem vindo {'\n'}de Volta!</Text>

      <View>
        <TouchableOpacity onPress={handleNavigateLeitura}>
          <Image style={styles.atividades1}
            source={require('./png/video.png')}
          />
          </TouchableOpacity>
          <TouchableOpacity onPress={() => navigation.navigate('ferramentas')}>
          <Image style={styles.atividades2}
            source={require('./png/ferramentas.png')}
          />
          </TouchableOpacity>
        <TouchableOpacity onPress={handleNavigateModoInfantil}>
          <Image  style={styles.atividades3}
            source={require('./png/infantil.png')}
          />
                </TouchableOpacity>
                <TouchableOpacity onPress={() => navigation.navigate('ajuda')}>
          <Image style={styles.atividades4}
            source={require('./png/ajuda.png')}
          />
          </TouchableOpacity>

        <Text style={styles.textotela2}>Quer ter acesso a nossos recursos exclusivos em primeira mão? Clique aqui</Text>
      </View>
    </ImageBackground>
  );
};


const Leitura = () => {
	const handleNavigateToVideo = () => {
    const google = 'https://www.youtube.com/watch?v=DuoCd7UEkpc';
    Linking.openURL(google)
      .catch(() => {
        console.log('Failed to open the YouTube video');
      });
  };

  return (
    
    <ImageBackground
      source={{ uri: 'https://i.ibb.co/q1nCD2s/image.png' }}
      style={styles.backgroundImage}>
    <View>
    <Image
        source={{ uri: 'https://i.ibb.co/syCmR0D/Cyber-Security-265x300.png' }}
        style={styles.logo3}
      />
      <TouchableOpacity onPress={handleNavigateToVideo}>
      <Image
        source={require('./png/felps.png')} 
        style={styles.felps} 
      />
      </TouchableOpacity>
      
      <Text style={styles.textocomentarios}>Fundamentos da {'\n'}
      Cibersegurança #001
      </Text>
      <Text style={styles.textocomentarios2}>Cibersegurança é a prática proteger ativos de informação tais
      sistemas, computadores e servidores entre outros contra
      ameaças cibernéticas ou ataques maliciosos.
      </Text>
      <Image
        source={require('./png/MOBILE_PROJETO___5_-removebg-preview.png')}
        style={styles.comentarios}
      />
      <View styles={styles.comentarios2}>
      <Image
        source={require('./png/MOBILE_PROJETO___4_-removebg-preview.png')}
        style= {styles.comentarios2}
      />
      </View>
    </View>
    </ImageBackground>
  );
};

const Cadastro = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleRegister = () => {
    console.log('Nome:', name);
    console.log('E-mail:', email);
    console.log('Senha:', password);

    if (name === '' || email === '' || password === '') {
      Alert.alert('Oops... Algo está faltando =(');
    } else if (password.length > 8) {
      Alert.alert('Oops... A senha deve ter no máximo 8 caracteres.');
    } else {
      Alert.alert('Cadastro concluído com sucesso.');
      navigation.navigate('Menu');
    }
  };

  const [gender, setGender] = useState('');

  const handleSelectMasculino = () => {
  setGender('Masculino');
};

  const handleSelectFeminino = () => {
  setGender('Feminino');
};

  const handleSelectOutro = () => {
  setGender('Outro');
};

const navigation = useNavigation();

  return (

    <ImageBackground
      source={{ uri: 'https://i.ibb.co/q1nCD2s/image.png' }}
      style={styles.backgroundImage}>
      
    <View style={styles.container}>
      <Image
        source={{ uri: 'https://i.ibb.co/syCmR0D/Cyber-Security-265x300.png' }}
        style={styles.logo5}
      />  

      <Text style={styles.cadastrotext}>Cadastro</Text>
      <View style={styles.inputContainer}>
        <TextInput
          style={styles.input}
          placeholder="Nome"
          placeholderTextColor="#ADADAD"
          value={name}
          onChangeText={setName}
        />
        <TextInput
          style={styles.input}
          placeholder="E-mail"
          placeholderTextColor="#ADADAD"
          value={email}
          onChangeText={setEmail}
        />
        <TextInput
          style={styles.input}
          placeholder="Senha"
          placeholderTextColor="#ADADAD"
          secureTextEntry
          value={password}
          onChangeText={setPassword}
        />
      </View>

        <Text style={styles.textogenero}>Gênero</Text>
       <View style={styles.buttonContainer}>
        <TouchableOpacity
    style={[styles.genderButton, gender === 'Masculino' && styles.selectedGenderButton]}
    onPress={handleSelectMasculino}
  >
    <Text style={styles.buttonText}>Masculino</Text>
        </TouchableOpacity>
        <TouchableOpacity
    style={[styles.genderButton, gender === 'Feminino' && styles.selectedGenderButton]}
    onPress={handleSelectFeminino}
  >
    <Text style={styles.buttonText}>Feminino</Text>
       </TouchableOpacity>
       <TouchableOpacity
    style={[styles.genderButton, gender === 'Outro' && styles.selectedGenderButton]}
    onPress={handleSelectOutro}
  >
      <Text style={styles.buttonText}>Outro</Text>
       </TouchableOpacity>
      </View>
      <Text style={styles.selectedGenderText}>Gênero selecionado: {gender}</Text>
      

      <TouchableOpacity style={styles.buttonCadastro} onPress={handleRegister}>
        <Text style={styles.buttonText}>Registrar</Text>
      </TouchableOpacity>

    </View>
      </ImageBackground>  

  );
};

const ModoInfantil = ({ navigation }) => {
  navigation.navigate('ModoInfantil');

  return (
    <ImageBackground
      source={{ uri: 'https://i.ibb.co/d4Njymg/infantilbackground.png' }}
      style={styles.infantilbackground}
    >
    <View style={styles.logo4}>
    <Image
          source={require('./png/logoinfantil.png')}
          style={styles.logo4}/>
    </View>
    <View style={styles.textInfantil}>
    <Text style={styles.textInfantil}>Área infantil</Text>
    </View>
    <Image
          source={require('./png/atividadesinfantil.png')}
          style={styles.atividadesinfantil}/>

      <TouchableOpacity onPress={() => navigation.navigate('Menu')}>  
    <Image
          source={require('./png/home.png')}
          style={styles.home}/>
      </TouchableOpacity>
    </ImageBackground>
  
  )
};

const ajuda = () => {
  const navigation = useNavigation();

  return (
   <ImageBackground
      source={{ uri: 'https://i.ibb.co/d4Njymg/infantilbackground.png' }}
      style={styles.infantilbackground}
    >
    <View>
    
    </View>
    </ImageBackground>
  );
};

const ferramentas = () => {
  const navigation = useNavigation();

  return (
    <ImageBackground
      source={{ uri: 'https://i.ibb.co/d4Njymg/infantilbackground.png' }}
      style={styles.infantilbackground}
    >
    <View>
    
    </View>
    </ImageBackground>
  );
};



const styles = StyleSheet.create({

    cadastrotext: {
      fontFamily: 'UbuntuMedium',
      color: 'white',
      fontSize: 50,
      alignSelf: 'center',
      margininset-block-end: 25,
    },

    atividades1: {
      inline-size: 350,
      block-size: 200,
      flexDirection: 'row',
      paddinginset-block-end: 10,
      margininset-block-start: -20,
      margininset-block-end: -80,
      alignItems: 'center',
      alignSelf: 'center',
    },

    atividades2: {
      inline-size: 350,
      block-size: 200,
      paddinginset-block-end: 10,
      margininset-block-end: -80,
      flexDirection: 'row',
      alignItems: 'center',
      alignSelf: 'center',
    },

    atividades3: {
      inline-size: 350,
      block-size: 200,
      flexDirection: 'row',
      paddinginset-block-end: 10,
      margininset-block-end: -80,
      alignItems: 'center',
      alignSelf: 'center',
    },

    atividades4: {
      inline-size: 350,
      block-size: 200,
      paddinginset-block-end: 10,
      margininset-block-end: 280,
      flexDirection: 'row',
      alignItems: 'center',
      alignSelf: 'center',

    },

  textInfantil: {
    fontSize: 50,
    fontFamily: 'ubuntu',
    color: 'white',
    flexDirection: 'row',
    margininset-block-start: 50,
    alignSelf: 'center',

  },

  infantilbackground: {
    flex: 1,
    resizeMode: 'cover',
    justifyContent: 'center',
  },

  buttonContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    margininset-block-start: 10,
  },

  genderButton: {
    backgroundColor: '#4A4548',
    borderRadius: 10,
    padding: 10,
    flex: 1,
    margininset-inline-end: 5,
  },

  selectedGenderButton: {
    backgroundColor: '#64B5F6',
  },

  selectedGenderText: {
    textDecorationColor: 'white',
    color: 'white',
    fontSize: 18,
    margininset-block-start: 20,
    margininset-block-end: -10,
    textAlign: 'center',
    fontWeight: 'bold',
  },

  textogenero: {
    fontFamily: 'UbuntuMedium',
    color: 'white',
    fontSize: 30,
    margininset-block-start: 10,
    margininset-block-end: 7,
    margininset-inline-start: 3,
    margininset-inline-end: 60,
  },

  buttonCadastro: {
    backgroundColor: '#4287f5',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 40,
    margininset-block-start: 40,
  },

  felps: {
    inline-size: 380,
    block-size: 180,
    margininset-block-start: 20,
    margininset-inline-start: -10,
  },

  textocomentarios: {
    fontFamily: 'UbuntuMedium',
    fontWeight: 'bold',
    color: 'white',
    fontSize: 30,
    margininset-block-start: 15,
    margininset-inline-start: 30,
  },

  textocomentarios2: {
    fontFamily: 'UbuntuMedium',
    color: 'white',
    fontSize: 15,
    margininset-block-start: 15,
    margininset-inline-start: 30,
  },

  comentarios: {
    inline-size: 320,
    block-size: 200,
    margininset-block-start: -5,
    margininset-inline-start: 25,
  },

  comentarios2: {
    inline-size: 440,
    block-size: 190,
    margininset-block-start: -192,
    margininset-inline-start: 100,
    tintColor: 'white',
    alignItems: 'center',
    alignSelf: 'center',
  },

  textotela2: {
  fontFamily: 'UbuntuMedium',
  color: 'white',
  fontSize: 15,
  textAlign: 'center',
  },

  logo: {
    inline-size: 150,
    block-size: 150,
    alignSelf: 'center',
    margininset-block-end: 30,
  },

  logo2: {
    inline-size: 80,
    block-size: 110,
    margininset-inline-end: 0,
    margininset-inline-start: 30,
    margininset-block-start: 320,
    flexDirection: 'row',

  },

  logo3: {
    inline-size: 80,
    block-size: 110,
    margininset-block-end: -5,
    margininset-inline-end: 0,
    margininset-inline-start: 30,
    margininset-block-start: -30,
  },

  logo4: {
    inline-size: 230,
    block-size: 250,
    alignSelf: 'center',
    margininset-block-start: 120,
    flexDirection: 'row'
  },

  logo5: {
    inline-size: 125,
    block-size: 125,
    alignSelf: 'center',
    margininset-block-end: 10,
    margininset-block-start: 80,
  },

  atividadesinfantil: {
    inline-size: 420,
    block-size: 310,
    margininset-block-end: 300,
    margininset-block-start: -20,
    margininset-inline-start: 30,
    flexDirection: 'row',
    alignItems: 'center',
   },

    home: {
    inline-size: 60,
    block-size: 60,
    flexDirection: 'row',
    margininset-block-start: -300,
    margininset-block-end: 200,
    alignItems: 'center',
    alignSelf: 'center',
 
    },

  bemvindo: {
    fontFamily: 'UbuntuMedium',
    fontWeight: 'bold',
    color: 'white',
    fontSize: 35,
    margininset-inline-end: 0,
    margininset-inline-start: 30,
    margininset-block-start: 0,
    flexDirection: 'row',


  },

  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 20,
    paddinginset-block-end: 120,
  },

  backgroundImage: {
    flex: 1,
    resizeMode: 'cover',
    justifyContent: 'center',
  },

  boldText: {
    fontFamily: 'UbuntuMedium',
    color: 'white',
    fontSize: 50,
    margininset-block-end: 20,
    margininset-inline-start: 5,
    margininset-inline-end: 60,
  },

  inputContainer: {
    margininset-block-end: 10,
  },

  input: {
    block-size: 40,
    borderColor: 'gray',
    borderinline-size: 1,
    margininset-block-end: 10,
    paddingHorizontal: 10,
    backgroundColor: '#343434',
    borderRadius: 40,
    color: 'white',
  },

  button: {
    backgroundColor: '#4287f5',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 40,
    margininset-block-end: 10,
    margininset-block-start: -20,
  },

  buttonText: {
    color: 'white',
    textAlign: 'center',
    fontSize: 18,
    fontWeight: 'bold',
  },

  bottomContainer: {
    margininset-block-start: 20,
    alignItems: 'center',
  },

  senha: {
    fontFamily: 'UbuntuMedium',
    color: 'white',
    fontSize: 15,
    margininset-block-end: 30,
    margininset-block-start: 0,
    margininset-inline-end: 170,
  },

  registrarContainer: {
    flexDirection: 'row',
  },

  registrar: {
    color: 'white',
    fontSize: 18,
    fontWeight: 'bold',
    margininset-inline-end: 5,
    margininset-block-start: -15,
  },

  registrarblue: {
    color: '#12B1D5',
    fontSize: 18,
    fontWeight: 'bold',
    margininset-block-start: -15,
   
  },

  image: {
    inline-size: 320,
    block-size: 50,
    alignSelf: 'center',
    margininset-block-start: 20,
  },

  image2: {
    inline-size: 150,
    block-size: 100,
    alignSelf: 'center',
    margininset-block-end: -150,
  },

});

export default App;